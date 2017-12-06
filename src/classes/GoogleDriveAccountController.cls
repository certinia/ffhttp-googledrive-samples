/**
 * Copyright (c) 2014, FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/
 
/**
 * GoogleDriveAccountController
 *
 * Simple app controller to demonstrate moving an Account attachment to Google Drive.
 */
public with sharing class GoogleDriveAccountController 
{
 	public Account acct;
    public Attachment[] attachments;
    public Note[] notes;
    public ConnectorService connectorService;
    public Boolean validConnector { get; set; }
    public ffhttp_GoogleDrive client;
    
    /**
     * Constructor
     */
    public GoogleDriveAccountController(ApexPages.StandardController stdController) 
    {
        this.acct = (Account)stdController.getRecord();
        this.connectorService = getConnectorService();
       	this.init();
    }
    
    private void init()
    {
    	if (connectorService != null)
        {
        	String msg = connectorService.validateConnector();
        	validConnector = String.isEmpty(msg);
        	if (!validConnector)
        	{
        		error(msg);
        	}
        }
        else
        {
        	error('Google Drive connector not found.');
        }
    }
    
    /**
     * Gets a valid connector for Google requests.
     *
     * Note: for separation of concerns consider using a selector pattern.
	 * See https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Selector_Layer
     */
    public ConnectorService getConnectorService()
    {
    	if (connectorService == null)
    	{	
    		try
    		{
	    		Connector__c c = 
	    		[
	    			SELECT 
	    				c.TokenType__c, c.RefreshToken__c, c.RefreshTokenRequested__c, c.Name, c.Id, c.AccessToken__c, 
					   	c.AccessTokenRequested__c, c.AccessTokenExpiry__c, c.Active__c, 
					   	ConnectorType__r.TokenEndpoint__c, ConnectorType__r.Scope__c, ConnectorType__r.ScopeRequired__c, 
					   	ConnectorType__r.RedirectUri__c, ConnectorType__r.Name, ConnectorType__r.Id, 
					   	ConnectorType__r.ExtraUrlParameters__c, ConnectorType__r.DeveloperName__c, 
					   	ConnectorType__r.ClientSecret__c, ConnectorType__r.ClientId__c, ConnectorType__r.CallbackURL__c, 
					   	ConnectorType__r.AuthorizationEndpoint__c
	    			FROM Connector__c c
	    			WHERE ConnectorType__r.Name =: GoogleDriveConfigure.GOOGLE_DRIVE_TYPE_LABEL
	    			AND c.OwnerId =: UserInfo.getUserID()
	    			LIMIT 1
	    		];
	    		
	    		if (c != null)
	    		{
	    			connectorService = new ConnectorService(c);
	    		}
    		}
    		catch (Exception ex)
    		{
    		}
    	}
    	return connectorService;
    }
    
    /**
     * Gets the Google Drive client
     */
    public ffhttp_GoogleDrive getGoogleDriveClient()
    {
    	if (client == null)
    	{
    		ffhttp_Client.ICredentials credentials = new ffhttp_Client.AccessTokenCredentials(connectorService.connector.TokenType__c,  connectorService.getAccessToken());
    		client = new ffhttp_GoogleDrive(credentials);
    	}
    	return client;
    }
    
    /**
     * Gets all the attachments related to this Account.
     */
    public Attachment[] getAttachments()
    {
    	if (attachments == null)
    	{
    		attachments = 
    		[
    			SELECT a.Name, a.Body, a.ContentType
    			FROM Attachment a 
    			WHERE a.ParentId =: acct.Id
    		];
    	}
    	return attachments;
    }
    
    /**
     * Gets all the notes related to this Account and checks if the URL is a Google Drive URL.
     */
    public Note[] getNotes()
    {
    	if (notes == null)
    	{
    		notes = 
    		[
    			SELECT n.Title, n.Body 
    			FROM Note n
    			WHERE n.ParentId =: acct.Id
    		];
    	}
    	
    	//Go through the notes for this Account.
    	//Check that the body of the note is a Google Drive note.
    	List<Note> notesToReturn = new List<Note>();
		for (Note n : notes)
		{
			String url = n.Body;
			if (url.startsWith('https://docs.google.com/'))
			{
				notesToReturn.add(n);
			}
		}
		
		notes = notesToReturn;
		
    	return notes;
    }
    
    /**
     * Main method to transfer the attachment to Google Drive.
     * 
     * This follows the following procedure:
     * 1. Get the attachment that the user selected.
     * 2. Transfer the attached file to Google Drive and return the URL.
     * 3. Create a new note setting the title to the name of the attached file and the body to the file URL.
     * 4. Delete the attachment.
     */
    public PageReference transferAttachmentToGoogleDrive()
    {
    	String msg = null;
		
		//Get the selected attachment.
	    Integer selectedRow = getSelectedRowAttachment();
	    	
	    Attachment selectedAttachment = attachments[selectedRow]; 	
	    	
    	try
    	{	  		
	    	String attachmentName = selectedAttachment.Name;
	    	Blob attachmentContent = selectedAttachment.Body;
	    	String attachmentContentType = selectedAttachment.ContentType;
	    	
	    	//Transfer the file to Google Drive.
	    	ffhttp_GoogleDriveModelFile gdf = sendAttachment(attachmentName, attachmentContent, attachmentContentType);
    
    		String gdfLink = gdf.getAlternateLink();
    	
    		//Create a new note with the body set to the link.
    		String accountId = String.valueOf(acct.Id);
    		Note googleDriveFileNote = new Note();
    		googleDriveFileNote.title=attachmentName;
    		googleDriveFileNote.body=gdfLink;
    		googleDriveFileNote.parentId=accountId;
    		insert googleDriveFileNote;
    		
    		notes.add(googleDriveFileNote);
    		
    		//Delete the attachment as it is no longer required.
			delete selectedAttachment;
			
			//Remove the attachment from the attachment list on this page.
			attachments.remove(selectedRow);
			
			//Show the user a message stating that the upload was successful.
			info(gdf.getTitle() + ' was successfully uploaded.');
			
			//Make sure that the connector has the latest token.
			update connectorService.connector;
    	}
    	catch (ffhttp_AppException ex)
    	{
    		error('The file was not successfully uploaded.');
    	}
    	
    	return null;
    }
   
    /**
     * Gets the selected note and redirects to the appropriate URL.
     */
    public PageReference viewFile()
 	{
 		Integer selectedRow = getSelectedRowNote();
 		
 		Note selectedNote = notes.get(selectedRow);
 		String url = selectedNote.Body;	
 		
 		PageReference retval = new PageReference(url);
 		retval.setRedirect(true);
 		return retval;
 	}
    
    /**
     * Adds the appropriate permissions to the Google Drive file for the contacts associated with the account.
     *
     * Note: This can potentially hit governor limits for callouts as a permission request is sent for each contact.
     */
    public PageReference shareFileToAccountContacts()
	{
		//First find all the account contacts.
		Contact[] accountContacts = 
		[
			SELECT c.Email
			FROM Contact c
			WHERE c.AccountId =: acct.Id
		];
		
		//Get the note that we intend to share and then the file associated with it.
		Integer selectedRow = getSelectedRowNote();
		Note selectedNote = notes.get(selectedRow);
		
		ffhttp_GoogleDriveModelFile selectedNoteFile = findGoogleDriveFileForNote(selectedNote);
		if (selectedNoteFile == null)
		{
			error(selectedNote.title + ' was not found in Google Drive.');
			return null;
		}
	
		//Next create a permission for each of the contacts. Give them read access.
		ffhttp_GoogleDrivePermissions permissions = getGoogleDriveClient().permissions();
		permissions.setFile(selectedNoteFile);					
							
		for (Contact accountContact : accountContacts)
		{
			try
			{
				ffhttp_GoogleDriveModelPermission permission = new ffhttp_GoogleDriveModelPermission();
				permission.setRole(ffhttp_GoogleDriveModelPermission.PERMISSION_ROLE_READER);
				permission.setType(ffhttp_GoogleDriveModelPermission.PERMISSION_TYPE_USER);
				permission.setValue(accountContact.Email);
				
				ffhttp_GoogleDrivePermissions.InsertRequest request = permissions.insertRequest(permission);
				request.execute();
			}
			catch (ffhttp_SystemException ex)
			{
				error(selectedNoteFile.getTitle() + ' was not successfully shared.');
				return null;
			}
		}
		
		info(selectedNoteFile.getTitle() + ' was successfully shared.');
		
		return null;
	}

	/**
	 * Deletes the selected file from Google Drive and then deletes the associated note record.
	 */
	public PageReference deleteFile()
	{
		Integer selectedRow = getSelectedRowNote();
	 		
	 	Note selectedNote = notes.get(selectedRow);	
	 		
		try
		{
	 		//Find the associated file for this note and delete it. 
	 		//If the file doesn't exist on Google Drive it doesn't matter (this is essentially a broken link in the note) 
	 		//just delete the note.
	 		ffhttp_GoogleDriveModelFile selectedNoteFile = findGoogleDriveFileForNote(selectedNote);
			if (selectedNoteFile != null)
			{
				deleteFile(selectedNoteFile);
			}
			
			notes.remove(selectedRow);
			
			//Now delete the note.
			delete selectedNote;
			
			info(selectedNote.title + ' was successfully deleted.');
		}
		catch (Exception ex)
		{
			error(selectedNote.title + ' was not deleted: ' + ex.getMessage());
		}
		
		return null;
	}
	
	/**
	 * Finds the Google Drive file for the selected note.
	 *
	 * To do this we search Google Drive for any file with the same name as the note, 
	 * then go through each of the GoogleDriveFiles checking whether the alternateLink 
	 * is the same as the URL on the note.
	 */
	private ffhttp_GoogleDriveModelFile findGoogleDriveFileForNote(Note selectedNote)
	{
		ffhttp_GoogleDriveModelFile retval = null;
		
		String selectedNoteFileName = selectedNote.title;
		String selectedNoteUrl = selectedNote.body;
	
		try
		{	
			retval = findFileForNameAndUrl(selectedNoteFileName, selectedNoteUrl);
		}
		catch (ffhttp_SystemException ex)
		{
			error('API Exception calling Google. The file was not uploaded.');
		}
		
		return retval;
	}

	private ffhttp_GoogleDriveModelFile findFileForNameAndUrl(String name, String url)
	{
		ffhttp_GoogleDriveModelFile retval = null;
		
		ffhttp_GoogleDriveModelFile.ItemList fileList = findFilesForName(name);
		
		List<ffhttp_GoogleDriveModelFile> files = (List<ffhttp_GoogleDriveModelFile>)fileList.getItems();
		for (ffhttp_GoogleDriveModelFile file : files)
		{
			String alternateLink = file.getAlternateLink();
			if (alternateLink != null 
			  && alternateLink.equals(url))
			{
				retval = file;
				break;
			}
		}
		
		return retval;
	}
	
	private ffhttp_GoogleDriveModelFile.ItemList findFilesForName(String name)
    {
    	String searchStr = 'title = \'' + name + '\' and trashed=false';
    	
    	ffhttp_GoogleDriveFiles files = getGoogleDriveClient().files();
    	ffhttp_GoogleDriveFiles.ListRequest request = files.listRequest();
    	request.setQ(searchStr);
    	request.setFields('items(id,alternateLink,permissions,title)');
    	
    	return (ffhttp_GoogleDriveModelFile.ItemList)request.execute();
    }
	
	/**
     * Sends an attachment to Google Drive.
     */
	private ffhttp_GoogleDriveModelFile sendAttachment(String fileName, Blob fileContents, String contentType) 
   	{
   		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
   		file.setTitle(fileName);
   		file.setMimeType(contentType);
        
        ffhttp_GoogleDriveFiles files = getGoogleDriveClient().files();
        
        //Insert the meta data for the file.
        file = (ffhttp_GoogleDriveModelFile)files.insertRequest(file, null).execute();

		//Update the file with the contents.        
        file = (ffhttp_GoogleDriveModelFile)files.updateRequest(file, fileContents).execute();
        
        return file;
    }
    
    /**
     * Deletes the file for the selected note.
     */
   	private void deleteFile(ffhttp_GoogleDriveModelFile file)
   	{
   		ffhttp_GoogleDriveFiles files = getGoogleDriveClient().files();
   		ffhttp_GoogleDriveFiles.DeleteRequest request = files.deleteRequest(file.getId());
   		request.execute();
   	}
	
	/**
	 * Methods to work out which attachment and row have been selected on the VisualForce page.
	 */
    private Integer getSelectedRowAttachment()
    {
    	return getSelectedRow('attachmentRowNumber');
    }
    private Integer getSelectedRowNote()
    {
    	return getSelectedRow('noteRowNumber');
    }
    private Integer getSelectedRow(String parameter)
 	{
 		PageReference reference = ApexPages.currentPage();
		Map<String, String> referenceParameter = reference.getParameters();
		Object rowIndexObj = referenceParameter.get(parameter);
		return Integer.valueOf(rowIndexObj);
 	}
 
 	void info(String msg)
 	{
 		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, msg));
 	}
 	
 	void error(String msg)
 	{
 		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, msg));
 	}
}
