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
 * GoogleDriveTestHarnessController
 * 
 * Controller class for testing all the Google Drive API calls.
 */
public with sharing class GoogleDriveTestHarnessController
{
	//Instance variables
	public ConnectorService connectorService;
	public Boolean validConnector { get; set; }    
	
    //About Requests
    public Long aboutGetRequestMaxChangeIdCount { get; set; }
    public Long aboutGetRequestStartChangeId { get; set; }
    public Boolean aboutGetRequestIncludeSubscribed { get; set; }	   
    public String aboutGetRequestFields { get; set; }  
    
    //App Requests
    public String appsGetRequestAppId { get; set; }
    public String appsGetRequestFields { get; set; }
    
    public String appsListRequestAppFilterExtensions { get; set; }  
	public String appsListRequestAppFilterMimeTypes { get; set; }  
	public String appsListRequestLanguageCode{ get; set; }
    public String appsListRequestFields { get; set; }  

    //Changes Requests
    public String changesGetRequestChangeId { get; set; }
    public String changesGetRequestFields { get; set; }  
    
    public Boolean changesListRequestIncludeDeleted { get; set; }
    public Boolean changesListRequestIncludeSubscribed  { get; set; }
    public Integer changesListRequestMaxResults { get; set; }
    public String changesListRequestPageToken { get; set; }
    public Long changesListRequestStartChangeId { get; set; }
    public String changesListRequestFields { get; set; }
   
   	public String changesWatchRequestId { get; set; }
	public String changesWatchRequestToken { get; set; }
	public Long changesWatchRequestExpiration { get; set; }
	public String changesWatchRequestType { get; set; }
	public String changesWatchRequestAddress { get; set; }
	public String changesWatchRequestFields { get; set; }
    
    //Children Requests
    public String childrenDeleteRequestFolderId { get; set; }
	public String childrenDeleteRequestChildId { get; set; }
	public String childrenDeleteRequestFields { get; set; }
	
	public String childrenGetRequestFolderId { get; set; }
	public String childrenGetRequestChildId { get; set; }
	public String childrenGetRequestFields { get; set; }	
	
	public String childrenInsertRequestFolderId { get; set; }
	public String childrenInsertRequestChildId { get; set; }
	public String childrenInsertRequestSelfLink { get; set; }
	public String childrenInsertRequestChildLink { get; set; }
	public String childrenInsertRequestFields { get; set; }
	
	public String childrenListRequestFolderId { get; set; }
	public Integer childrenListRequestMaxResults { get; set; }
    public String childrenListRequestPageToken { get; set; }
    public String childrenListRequestQ { get; set; }
    public String childrenListRequestFields { get; set; }
    
    //Comments Requests
   	public String commentsDeleteRequestFileId { get; set; }
	public String commentsDeleteRequestCommentId { get; set; }
	public String commentsDeleteRequestFields { get; set; }
   
  	public String commentsGetRequestFileId { get; set; }
	public String commentsGetRequestCommentId { get; set; }
	public Boolean commentsGetRequestIncludeDeleted { get; set; }
	public String commentsGetRequestFields { get; set; }
	
	public String commentsInsertRequestFileId { get; set; }
    public String commentsInsertRequestContent { get; set; }
    public String commentsInsertRequestContextType { get; set; }
    public String commentsInsertRequestContextValue { get; set; }
    public String commentsInsertRequestFields { get; set; }
    	
	public String commentsListRequestFileId { get; set; }
	public Boolean commentsListRequestIncludeDeleted { get; set; }
	public Integer commentsListRequestMaxResults { get; set; }
	public String commentsListRequestPageToken { get; set; }
	public String commentsListRequestUpdatedMin { get; set; }
	public String commentsListRequestFields { get; set; }
	
	public String commentsUpdateRequestFileId { get; set; }
	public String commentsUpdateRequestCommentId { get; set; }
    public String commentsUpdateRequestContent { get; set; }
    public String commentsUpdateRequestFields { get; set; }
   
   	//Files Requests
   	public String filesDeleteRequestId { get; set; }
   	public String filesDeleteRequestFields { get; set; }
	
   	public String filesGetRequestId { get; set; }
   	public Boolean filesGetRequestUpdateViewedDate { get; set; }
	public String filesGetRequestFields { get; set; }
   	
   	public String filesCopyRequestId { get; set; }
   	public Boolean filesCopyRequestConvert { get; set; }
	public Boolean filesCopyRequestOcr { get; set; }
	public String filesCopyRequestOcrLanguage { get; set; }
	public Boolean filesCopyRequestPinned { get; set; }
	public String filesCopyRequestTimedTextLanguage { get; set; }
	public String filesCopyRequestTimedTextTrackName { get; set; }
	public String filesCopyRequestVisibility { get; set; } 
	public String filesCopyRequestDescription	{ get; set; }
	public String filesCopyRequestIndexableText { get; set; }
	public Boolean filesCopyRequestLabelsRestricted { get; set; }
	public Boolean filesCopyRequestLabelsStarred { get; set; }
	public Boolean filesCopyRequestLabelsTrashed { get; set; }
	public Boolean filesCopyRequestLabelsViewed { get; set; }
	public DateTime filesCopyRequestLastViewedByMeDate	{ get; set; }
	public DateTime filesCopyRequestMarkedViewedByMeDate { get; set; }
	public String filesCopyRequestMimeType { get; set; }
	public DateTime filesCopyRequestModifiedDate { get; set; }
	public String filesCopyRequestTitle { get; set; }
	public Boolean filesCopyRequestWritersCanShare { get; set; }
   	public String filesCopyRequestFields { get; set; }
   	
   	public Boolean filesInsertRequestConvert { get; set; }
	public Boolean filesInsertRequestOcr { get; set; }
	public String filesInsertRequestOcrLanguage { get; set; }
	public Boolean filesInsertRequestPinned { get; set; }
	public String filesInsertRequestTimedTextLanguage { get; set; }
	public String filesInsertRequestTimedTextTrackName { get; set; }
	public Boolean filesInsertRequestUseContentAsIndexableText { get; set; }
	public String filesInsertRequestVisibility { get; set; } 
	public String filesInsertRequestDescription	{ get; set; }
	public String filesInsertRequestIndexableText { get; set; }
	public Boolean filesInsertRequestLabelsRestricted { get; set; }
	public Boolean filesInsertRequestLabelsStarred { get; set; }
	public Boolean filesInsertRequestLabelsTrashed { get; set; }
	public Boolean filesInsertRequestLabelsViewed { get; set; }
	public DateTime filesInsertRequestLastViewedByMeDate	{ get; set; }
	public DateTime filesInsertRequestMarkedViewedByMeDate { get; set; }
	public String filesInsertRequestMimeType { get; set; }
	public DateTime filesInsertRequestModifiedDate { get; set; }
	public String filesInsertRequestTitle { get; set; }
	public Boolean filesInsertRequestWritersCanShare { get; set; }
   	public String filesInsertRequestFields { get; set; }
   	
   	public String filesUpdateRequestAddParents{ get; set; }
	public Boolean filesUpdateRequestConvert { get; set; }
	public Boolean filesUpdateRequestNewRevision { get; set; }
	public Boolean filesUpdateRequestOcr { get; set; }
	public String filesUpdateRequestOcrLanguage { get; set; }
	public Boolean filesUpdateRequestPinned { get; set; }
	public String filesUpdateRequestRemoveParents { get; set; }
	public Boolean filesUpdateRequestSetModifiedDate { get; set; }
	public String filesUpdateRequestTimedTextLanguage { get; set; }
	public String filesUpdateRequestTimedTextTrackName { get; set; }
	public Boolean filesUpdateRequestUpdateViewedDate { get; set; }
	public Boolean filesUpdateRequestUseContentAsIndexableText { get; set; }

	public String filesUpdateRequestFileId { get; set; }
	public String filesUpdateRequestDescription	{ get; set; }
	public String filesUpdateRequestIndexableText { get; set; }
	public Boolean filesUpdateRequestLabelsRestricted { get; set; }
	public Boolean filesUpdateRequestLabelsStarred { get; set; }
	public Boolean filesUpdateRequestLabelsTrashed { get; set; }
	public Boolean filesUpdateRequestLabelsViewed { get; set; }
	public DateTime filesUpdateRequestLastViewedByMeDate	{ get; set; }
	public DateTime filesUpdateRequestMarkedViewedByMeDate { get; set; }
	public String filesUpdateRequestMimeType { get; set; }
	public DateTime filesUpdateRequestModifiedDate { get; set; }
	public String filesUpdateRequestTitle { get; set; }
	public Boolean filesUpdateRequestWritersCanShare { get; set; }
   	
   	public String filesUpdateRequestFields { get; set; }
   
   	public String filesListRequestCorpus { get; set; }
	public Integer filesListRequestMaxResults { get; set; }
    public String filesListRequestPageToken { get; set; }
    public String filesListRequestQ { get; set; }
    public String filesListRequestFields { get; set; }
    
    public String filesTouchRequestId { get; set; }
	public String filesTouchRequestFields { get; set; }
							
    public String filesTrashRequestId { get; set; }
	public String filesTrashRequestFields { get; set; }
	
	public String filesUntrashRequestId { get; set; }
	public String filesUntrashRequestFields { get; set; }
	
	public String filesWatchRequestFileId { get; set; }
	public String filesWatchRequestId { get; set; }
	public String filesWatchRequestToken { get; set; }
	public Long filesWatchRequestExpiration { get; set; }
	public String filesWatchRequestType { get; set; }
	public String filesWatchRequestAddress { get; set; }
	public String filesWatchRequestFields { get; set; }
   
  	//Parents Requests
    public String parentsDeleteRequestFileId { get; set; }
	public String parentsDeleteRequestParentId { get; set; }
	public String parentsDeleteRequestFields { get; set; }
	
	public String parentsGetRequestFileId { get; set; }
	public String parentsGetRequestParentId { get; set; }
	public String parentsGetRequestFields { get; set; }	
	
	public String parentsInsertRequestFileId { get; set; }
	public String parentsInsertRequestParentId { get; set; }
	public String parentsInsertRequestFields { get; set; }
	
	public String parentsListRequestFileId { get; set; }
    public String parentsListRequestFields { get; set; }
    
    //Permissions Requests
    public String permissionsDeleteRequestFileId { get; set; }
	public String permissionsDeleteRequestPermissionId { get; set; }
	public String permissionsDeleteRequestFields { get; set; }
	
	public String permissionsGetRequestFileId { get; set; }
	public String permissionsGetRequestPermissionId { get; set; }
	public String permissionsGetRequestFields { get; set; }	
	
	public String permissionsGetIdForEmailRequestEmail { get; set; }
    public String permissionsGetIdForEmailRequestFields { get; set; }
    	
	public String permissionsInsertRequestFileId { get; set; }
	public String permissionsInsertRequestEmailMessage { get; set; }
	public Boolean permissionsInsertRequestSendNotificationEmails { get; set; }
	public String permissionsInsertRequestFields { get; set; }
								
	public String permissionsInsertRequestRole { get; set; }
	public String permissionsInsertRequestType { get; set; }
	public String[] permissionsInsertRequestAdditionalRoles { get; set; }
	public String permissionsInsertRequestPermissionId { get; set; }
	public String permissionsInsertRequestValue { get; set; }
	public Boolean permissionsInsertRequestWithLink { get; set; }

	public String permissionsListRequestFileId { get; set; }
    public String permissionsListRequestFields { get; set; }
    
    public String permissionsUpdateRequestFileId { get; set; }
	public String permissionsUpdateRequestPermissionId { get; set; }
	public Boolean permissionsUpdateRequestTransferOwnership { get; set; }	
	public String[] permissionsUpdateRequestAdditionalRoles { get; set; }
	public String permissionsUpdateRequestRole { get; set; }
	public String permissionsUpdateRequestFields { get; set; }
	
	//Properties Requests
	public String propertiesDeleteRequestFileId { get; set; }
	public String propertiesDeleteRequestPropertyKey { get; set; }
	public String propertiesDeleteRequestVisibility { get; set; }
	public String propertiesDeleteRequestFields { get; set; }
	
	public String propertiesGetRequestFileId { get; set; }
	public String propertiesGetRequestPropertyKey { get; set; }
	public String propertiesGetRequestVisibility { get; set; }
	public String propertiesGetRequestFields { get; set; }
	
	public String propertiesInsertRequestFileId { get; set; }
	public String propertiesInsertRequestPropertyKey { get; set; }
	public String propertiesInsertRequestValue { get; set; }
	public String propertiesInsertRequestVisibility { get; set; }
	public String propertiesInsertRequestFields { get; set; }
    	
	public String propertiesListRequestFileId { get; set; }
	public String propertiesListRequestFields { get; set; }
	
	public String propertiesUpdateRequestFileId { get; set; }
	public String propertiesUpdateRequestPropertyKey { get; set; }
	public String propertiesUpdateRequestValue { get; set; }
	public String propertiesUpdateRequestVisibility { get; set; }
	public String propertiesUpdateRequestFields { get; set; }
	
	//Replies Requests
   	public String repliesDeleteRequestFileId { get; set; }
	public String repliesDeleteRequestCommentId { get; set; }
	public String repliesDeleteRequestReplyId { get; set; }
	public String repliesDeleteRequestFields { get; set; }
   
  	public String repliesGetRequestFileId { get; set; }
	public String repliesGetRequestCommentId { get; set; }
	public String repliesGetRequestReplyId { get; set; }
	public Boolean repliesGetRequestIncludeDeleted { get; set; }
	public String repliesGetRequestFields { get; set; }
	
	public String repliesInsertRequestFileId { get; set; }
	public String repliesInsertRequestCommentId { get; set; }
	public String repliesInsertRequestContent { get; set; }
	public String repliesInsertRequestVerb { get; set; }
	public String repliesInsertRequestFields { get; set; }
    	
	public String repliesListRequestFileId { get; set; }
	public String repliesListRequestCommentId { get; set; }
	public Boolean repliesListRequestIncludeDeleted { get; set; }
	public Integer repliesListRequestMaxResults { get; set; }
	public String repliesListRequestPageToken { get; set; }
	public String repliesListRequestFields { get; set; }
	
	public String repliesUpdateRequestFileId { get; set; }
	public String repliesUpdateRequestCommentId { get; set; }
	public String repliesUpdateRequestReplyId { get; set; }
	public String repliesUpdateRequestContent { get; set; }
	public String repliesUpdateRequestVerb { get; set; }
	public String repliesUpdateRequestFields { get; set; }
	
	//Revisions Requests
   	public String revisionsDeleteRequestFileId { get; set; }
	public String revisionsDeleteRequestRevisionId { get; set; }
	public String revisionsDeleteRequestFields { get; set; }
   
  	public String revisionsGetRequestFileId { get; set; }
	public String revisionsGetRequestRevisionId { get; set; }
	public String revisionsGetRequestFields { get; set; }
    	
	public String revisionsListRequestFileId { get; set; }
	public String revisionsListRequestFields { get; set; }
	
	public String revisionsUpdateRequestFileId { get; set; }
	public String revisionsUpdateRequestRevisionId { get; set; }
	public Boolean revisionsUpdateRequestPinned { get; set; }
	public Boolean revisionsUpdateRequestPublished { get; set; }
	public Boolean revisionsUpdateRequestPublishAuto { get; set; }
	public Boolean revisionsUpdateRequestPublishedOutsideDomain { get; set; }
	public String revisionsUpdateRequestFields { get; set; }
	
   	//Files associated with requests. 
    //Declared transient as they should not be saved to the ViewState.
   	public transient Blob filesInsertRequestFileBody { get; set; }
   	public transient Blob filesUpdateRequestFileBody { get; set; }
   
    /**
     * Constructors
     */
    public GoogleDriveTestHarnessController()
    {
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
        	else
        	{
        		info('Successful authentication. The \'' + connectorService.Connector.Name + '\' connector is being used for authentication.');
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
     * About requests
     */
    public void aboutGetRequest()
    {
    	ffhttp_GoogleDriveAbout about = createGoogleDriveAbout();
    	if (about == null)
    	{	
    		return;
    	}
    	
    	ffhttp_GoogleDriveAbout.GetRequest request = about.getRequest();
    	
    	if (aboutGetRequestMaxChangeIdCount != null && aboutGetRequestMaxChangeIdCount > 0)
    	{
    		request.setMaxChangeIdCount(aboutGetRequestMaxChangeIdCount);
    	}
    	
    	if (aboutGetRequestStartChangeId != null && aboutGetRequestStartChangeId > 0)
    	{
    		request.setStartChangeId(aboutGetRequestStartChangeId);
    	}
    	
    	if (aboutGetRequestIncludeSubscribed != null)
    	{
    		request.setIncludeSubscribed(aboutGetRequestIncludeSubscribed);
    	}
    	
    	addFieldsParam(request, aboutGetRequestFields);
    	execute(request);
    }
    
    public ffhttp_GoogleDriveAbout createGoogleDriveAbout()
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
        ffhttp_GoogleDrive gd = createGoogleDrive();
        return (ffhttp_GoogleDriveAbout)gd.about();    
    }
    
    /**
     * Apps requests
     */
    public void appsGetRequest()
    {
    	ffhttp_GoogleDriveApps apps = createGoogleDriveApps();
    	if (apps == null
    	 || stringValueNotSet('Apps', 'Id', appsGetRequestAppId))
    	{	
    		return;
    	}
    	
    	ffhttp_GoogleDriveApps.GetRequest request = apps.getRequest(appsGetRequestAppId);
    	addFieldsParam(request, appsGetRequestFields);
    	execute(request);
    }
    
    public void appsListRequest()
    {
    	ffhttp_GoogleDriveApps apps = createGoogleDriveApps();
    	if (apps == null)
    	{	
    		return;
    	}
    	
    	ffhttp_GoogleDriveApps.ListRequest request = apps.listRequest();
  
    	if (!String.isEmpty(appsListRequestAppFilterExtensions))
    	{
    		request.setAppFilterExtensions(appsListRequestAppFilterExtensions);
    	}

		if (!String.isEmpty(appsListRequestAppFilterMimeTypes))
    	{
    		request.setAppFilterMimeTypes(appsListRequestAppFilterMimeTypes);
    	}
    	
    	if (!String.isEmpty(appsListRequestLanguageCode))
    	{
    		request.setLanguageCode(appsListRequestLanguageCode);
    	}
    	  	
    	addFieldsParam(request, appsListRequestFields);
    	execute(request);
    }
    
    public ffhttp_GoogleDriveApps createGoogleDriveApps()
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
        ffhttp_GoogleDrive gd = createGoogleDrive();
        return (ffhttp_GoogleDriveApps)gd.apps();    
    }
    
    /**
     * Changes requests
     */
    public void changesGetRequest()
    {
    	ffhttp_GoogleDriveChanges changes = createGoogleDriveChanges();
        if (changes == null
         || stringValueNotSet('Changes', 'Id', changesGetRequestChangeId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveChanges.GetRequest request = changes.getRequest(changesGetRequestChangeId);
    	addFieldsParam(request, changesGetRequestFields);
    	execute(request);
    }
    
    public void changesListRequest()
    {
        ffhttp_GoogleDriveChanges changes = createGoogleDriveChanges();
        if (changes == null)
        {
        	return;
        }
        
        ffhttp_GoogleDriveChanges.ListRequest request = changes.listRequest();
        if (changesListRequestIncludeDeleted != null)
		{
			request.setIncludeDeleted(changesListRequestIncludeDeleted);
		}
		
		if (changesListRequestIncludeSubscribed != null)
		{
			request.setIncludeSubscribed(changesListRequestIncludeSubscribed);
		}
		
		if (changesListRequestMaxResults != null 
		  && changesListRequestMaxResults > 0)
		{
			request.setMaxResults(changesListRequestMaxResults);
		}
		
		if (!String.isEmpty(changesListRequestPageToken))
		{
			request.setPageToken(changesListRequestPageToken);
		}
		
		if (changesListRequestStartChangeId != null && changesListRequestStartChangeId > 0)
    	{
    		request.setStartChangeId(changesListRequestStartChangeId);
    	}
    	
    	addFieldsParam(request, changesListRequestFields);
    	execute(request);
    }
    
    public void changesWatchRequest()
    {
    	ffhttp_GoogleDriveChanges changes = createGoogleDriveChanges();
        if (changes == null)
        {
        	return;
        }
        
        ffhttp_GoogleDriveModelWatch watch = new ffhttp_GoogleDriveModelWatch();
        watch.setId(changesWatchRequestId);
        watch.setToken(changesWatchRequestToken);
        watch.setExpiration(changesWatchRequestExpiration);
        watch.setType(changesWatchRequestType);
        watch.setAddress(changesWatchRequestAddress);
        	    
        ffhttp_GoogleDriveChanges.WatchRequest request = changes.watchRequest(watch);
        addFieldsParam(request, changesWatchRequestFields);
        execute(request);
    }
    
    public ffhttp_GoogleDriveChanges createGoogleDriveChanges()
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
       	ffhttp_GoogleDrive gd = createGoogleDrive();
        return (ffhttp_GoogleDriveChanges)gd.changes();    
    }
    
    /**
     * Children Requests
     */
    public void childrenDeleteRequest()
    {
    	ffhttp_GoogleDriveChildren children = createGoogleDriveChildren(childrenDeleteRequestFolderId);
        if (children == null
         || stringValueNotSet('Children', 'Child Id', childrenDeleteRequestChildId))
		{
			return;
		}
    
    	ffhttp_GoogleDriveChildren.DeleteRequest request = children.deleteRequest(childrenDeleteRequestChildId);
    	addFieldsParam(request, childrenDeleteRequestFields);
    	execute(request);
    }
    
    public void childrenGetRequest()
    {
    	ffhttp_GoogleDriveChildren children = createGoogleDriveChildren(childrenGetRequestFolderId);
        if (children == null
         || stringValueNotSet('Children', 'Child Id', childrenGetRequestChildId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveChildren.GetRequest request = children.getRequest(childrenGetRequestChildId);
    	addFieldsParam(request, childrenGetRequestFields);
    	execute(request);
    }
    
    public void childrenInsertRequest()
    {
    	ffhttp_GoogleDriveChildren children = createGoogleDriveChildren(childrenInsertRequestFolderId);
        if (children == null
         || stringValueNotSet('Children', 'Child Id', childrenInsertRequestChildId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveModelChild child = new ffhttp_GoogleDriveModelChild();
    	child.setId(childrenInsertRequestChildId);
		child.setSelfLink(childrenInsertRequestSelfLink); 
		child.setChildLink(childrenInsertRequestChildLink); 
    	
    	ffhttp_GoogleDriveChildren.InsertRequest request = children.insertRequest(child);
    	addFieldsParam(request, childrenInsertRequestFields);
    	execute(request);
    }
    
    public void childrenListRequest()
    {
    	ffhttp_GoogleDriveChildren children = createGoogleDriveChildren(childrenListRequestFolderId);
        if (children == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDriveChildren.ListRequest request = children.listRequest();
    	
    	if (childrenListRequestMaxResults != null 
		  && childrenListRequestMaxResults > 0)
		{
			request.setMaxResults(childrenListRequestMaxResults);
		}
		
		if (!String.isEmpty(childrenListRequestPageToken))
		{
			request.setPageToken(childrenListRequestPageToken);
		}
		
		if (!String.isEmpty(childrenListRequestQ))
		{
			request.setPageToken(childrenListRequestQ);
		}
    	
    	addFieldsParam(request, childrenListRequestFields);
    	execute(request);
    }
    
    public ffhttp_GoogleDriveChildren createGoogleDriveChildren(String childrenFolderId)
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
    	if (stringValueNotSet('Children', 'Folder Id', childrenFolderId))
    	{
    		return null;
    	}
    	
        ffhttp_GoogleDrive gd = createGoogleDrive();
        ffhttp_GoogleDriveChildren children = gd.children();
        
        ffhttp_GoogleDriveModelFile folder = new ffhttp_GoogleDriveModelFile();
    	folder.setId(childrenListRequestFolderId);
    	children.setFile(folder);
    	
    	return children;
    }
    
    /**
     * Comments Requests
     */
    public void commentsDeleteRequest()
    {
    	ffhttp_GoogleDriveComments comments = createGoogleDriveComments(commentsDeleteRequestCommentId);
        if (comments == null
         || stringValueNotSet('Comments', 'Comment Id', commentsDeleteRequestCommentId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveComments.DeleteRequest request = comments.deleteRequest(commentsDeleteRequestCommentId);
    	addFieldsParam(request, commentsDeleteRequestFields);
    	execute(request);
    }
    
    public void commentsGetRequest()
    {
    	ffhttp_GoogleDriveComments comments = createGoogleDriveComments(commentsGetRequestFileId);
        if (comments == null
         || stringValueNotSet('Comments', 'Comment Id', commentsGetRequestCommentId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveComments.GetRequest request = comments.getRequest(commentsGetRequestCommentId);
    	
    	if (commentsGetRequestIncludeDeleted != null)
    	{
    		request.setIncludeDeleted(commentsGetRequestIncludeDeleted);
    	}
    	
    	addFieldsParam(request, commentsGetRequestFields);
    	execute(request);
    }
    
    public void commentsInsertRequest()
    {
    	ffhttp_GoogleDriveComments comments = createGoogleDriveComments(commentsInsertRequestFileId);
        if (comments == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDriveModelComment.Context context = new ffhttp_GoogleDriveModelComment.Context();
    	context.setType(commentsInsertRequestContextType);
    	context.setValue(commentsInsertRequestContextValue);
    	
    	ffhttp_GoogleDriveModelComment comment = new ffhttp_GoogleDriveModelComment();
    	comment.setContent(commentsInsertRequestContent);
    	comment.setContext(Context);
    	
    	ffhttp_GoogleDriveComments.InsertRequest request = comments.insertRequest(comment);
    	addFieldsParam(request, commentsInsertRequestFields);
    	execute(request);
    }
    
    public void commentsListRequest()
    {
    	ffhttp_GoogleDriveComments comments = createGoogleDriveComments(commentsListRequestFileId);
        if (comments == null)
        {
			return;
		}
    	
    	ffhttp_GoogleDriveComments.ListRequest request = comments.listRequest();
    	
    	if (commentsListRequestIncludeDeleted != null)
		{
			request.setIncludeDeleted(commentsListRequestIncludeDeleted);
		}
	
		if (commentsListRequestMaxResults != null 
		  && commentsListRequestMaxResults > 0)
		{
			request.setMaxResults(commentsListRequestMaxResults);
		}
		
		if (!String.isEmpty(commentsListRequestPageToken))
		{
			request.setPageToken(commentsListRequestPageToken);
		}
    	
    	if (!String.isEmpty(commentsListRequestUpdatedMin))
		{
			request.setPageToken(commentsListRequestUpdatedMin);
		}
    	
    	addFieldsParam(request, commentsListRequestFields);
    	execute(request);
    }
    
    public void commentsUpdateRequest()
    {
    	ffhttp_GoogleDriveComments comments = createGoogleDriveComments(commentsUpdateRequestFileId);
        if (comments == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDriveModelComment comment = new ffhttp_GoogleDriveModelComment();
    	comment.setCommentId(commentsUpdateRequestCommentId);
    	comment.setContent(commentsUpdateRequestContent);
    	
    	ffhttp_GoogleDriveComments.UpdateRequest request = comments.updateRequest(comment);
    	addFieldsParam(request, commentsUpdateRequestFields);
    	execute(request);
    }
    
    public ffhttp_GoogleDriveComments createGoogleDriveComments(String commentsFileId)
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
    	if (stringValueNotSet('Comments', 'File Id', commentsFileId))
    	{
    		return null;
    	}
    	
    	ffhttp_GoogleDrive gd = createGoogleDrive();
    	ffhttp_GoogleDriveComments comments = gd.comments();  
        
    	ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
    	file.setId(commentsFileId);
    	comments.setFile(file);
    	return comments;
    }
    
    /**
     * Files Requests
     */
    public void filesDeleteRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null
       	  || stringValueNotSet('Files', 'File Id', filesDeleteRequestId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveFiles.DeleteRequest request = files.deleteRequest(filesDeleteRequestId);
    	addFieldsParam(request, filesDeleteRequestFields);
    	execute(request);
    }
     
    public void filesGetRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null
       	  || stringValueNotSet('Files', 'File Id', filesGetRequestId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveFiles.GetRequest request = files.getRequest(filesGetRequestId);
    	
    	if (filesGetRequestUpdateViewedDate != null)
    	{
    		request.setUpdateViewedDate(filesGetRequestUpdateViewedDate);
    	}
    	
    	addFieldsParam(request, filesGetRequestFields);
    	execute(request);
    }
    
    public void filesCopyRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveModelFile.IndexableText indexableText = new ffhttp_GoogleDriveModelFile.IndexableText();
		indexableText.setText(filesCopyRequestIndexableText);
		
		ffhttp_GoogleDriveModelFile.Labels labels = new ffhttp_GoogleDriveModelFile.Labels();
		labels.setStarred(filesCopyRequestLabelsStarred);
		labels.setTrashed(filesCopyRequestLabelsTrashed);
		labels.setRestricted(filesCopyRequestLabelsRestricted);
		labels.setViewed(filesCopyRequestLabelsViewed);
		
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setDescription(filesCopyRequestDescription);
		file.setLabels(labels);
		file.setTitle(filesCopyRequestTitle);
		file.setMimeType(filesCopyRequestMimeType);
		file.setIndexableText(indexableText);
		file.setLastViewedByMeDate(filesCopyRequestLastViewedByMeDate);
		file.setMarkedViewedByMeDate(filesCopyRequestMarkedViewedByMeDate);
		file.setModifiedDate(filesCopyRequestModifiedDate);
		file.setWritersCanShare(filesCopyRequestWritersCanShare);
   	
    	ffhttp_GoogleDriveFiles.CopyRequest request = files.copyRequest(filesCopyRequestId, file);
    	
    	if (filesCopyRequestConvert != null)
    	{
    		request.setConvert(filesCopyRequestConvert);
    	}
		
		if (filesCopyRequestOcr != null)
		{
			request.setOcr(filesCopyRequestOcr);
		}
		
		if (!String.isEmpty(filesCopyRequestOcrLanguage))
		{
			request.setOcrLanguage(filesCopyRequestOcrLanguage);
		}
		
		if (filesCopyRequestPinned != null)
		{
			request.setPinned(filesCopyRequestPinned);
		}
		
		if (!String.isEmpty(filesCopyRequestTimedTextLanguage))
		{
			request.setTimedTextLanguage(filesCopyRequestTimedTextLanguage);
		}
		
		if (!String.isEmpty(filesCopyRequestTimedTextTrackName))
		{
			request.setTimedTextTrackName(filesCopyRequestTimedTextTrackName);
		}
		
		if (!String.isEmpty(filesCopyRequestVisibility))
		{
			request.setVisibility(filesCopyRequestVisibility);
		}
    	
    	addFieldsParam(request, filesCopyRequestFields);
    	execute(request);
    }
    
    public void filesInsertRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveModelFile.IndexableText indexableText = new ffhttp_GoogleDriveModelFile.IndexableText();
		indexableText.setText(filesInsertRequestIndexableText);
		
		ffhttp_GoogleDriveModelFile.Labels labels = new ffhttp_GoogleDriveModelFile.Labels();
		labels.setStarred(filesInsertRequestLabelsStarred);
		labels.setTrashed(filesInsertRequestLabelsTrashed);
		labels.setRestricted(filesInsertRequestLabelsRestricted);
		labels.setViewed(filesInsertRequestLabelsViewed);
		
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setDescription(filesInsertRequestDescription);
		file.setLabels(labels);
		file.setTitle(filesInsertRequestTitle);
		file.setMimeType(filesInsertRequestMimeType);
		file.setIndexableText(indexableText);
		file.setLastViewedByMeDate(filesInsertRequestLastViewedByMeDate);
		file.setMarkedViewedByMeDate(filesInsertRequestMarkedViewedByMeDate);
		file.setModifiedDate(filesInsertRequestModifiedDate);
		file.setWritersCanShare(filesInsertRequestWritersCanShare);
   	
    	ffhttp_GoogleDriveFiles.InsertRequest request = files.insertRequest(file, filesInsertRequestFileBody);
    	
    	if (filesInsertRequestConvert != null)
    	{
    		request.setConvert(filesInsertRequestConvert);
    	}
		
		if (filesInsertRequestOcr != null)
		{
			request.setOcr(filesInsertRequestOcr);
		}
		
		if (!String.isEmpty(filesInsertRequestOcrLanguage))
		{
			request.setOcrLanguage(filesInsertRequestOcrLanguage);
		}
		
		if (filesInsertRequestPinned != null)
		{
			request.setPinned(filesInsertRequestPinned);
		}
		
		if (!String.isEmpty(filesInsertRequestTimedTextLanguage))
		{
			request.setTimedTextLanguage(filesInsertRequestTimedTextLanguage);
		}
		
		if (!String.isEmpty(filesInsertRequestTimedTextTrackName))
		{
			request.setTimedTextTrackName(filesInsertRequestTimedTextTrackName);
		}
		
		if (filesInsertRequestUseContentAsIndexableText != null)
		{
			request.setUseContentAsIndexableText(filesInsertRequestUseContentAsIndexableText);
		}
		
		if (!String.isEmpty(filesInsertRequestVisibility))
		{
			request.setVisibility(filesInsertRequestVisibility);
		}
    	
    	addFieldsParam(request, filesInsertRequestFields);
    	execute(request);
    }
    	
    public void filesListRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDriveFiles.ListRequest request = files.listRequest();
    	
    	if (!String.isEmpty(filesListRequestCorpus))
    	{
    		request.setCorpus(filesListRequestCorpus);
    	}
    	
    	if (filesListRequestMaxResults != null 
		  && filesListRequestMaxResults > 0)
		{
			request.setMaxResults(filesListRequestMaxResults);
		}
		
		if (!String.isEmpty(filesListRequestPageToken))
		{
			request.setPageToken(filesListRequestPageToken);
		}
		
		if (!String.isEmpty(filesListRequestQ))
		{
			request.setQ(filesListRequestQ);
		}
    	
    	addFieldsParam(request, filesListRequestFields);
    	execute(request);
    } 
    
    public void filesUpdateRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveModelFile.IndexableText indexableText = new ffhttp_GoogleDriveModelFile.IndexableText();
		indexableText.setText(filesUpdateRequestIndexableText);
		
		ffhttp_GoogleDriveModelFile.Labels labels = new ffhttp_GoogleDriveModelFile.Labels();
		labels.setStarred(filesUpdateRequestLabelsStarred);
		labels.setTrashed(filesUpdateRequestLabelsTrashed);
		labels.setRestricted(filesUpdateRequestLabelsRestricted);
		labels.setViewed(filesUpdateRequestLabelsViewed);
		
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId(filesUpdateRequestFileId);
		file.setDescription(filesUpdateRequestDescription);
		file.setLabels(labels);
		file.setTitle(filesUpdateRequestTitle);
		file.setMimeType(filesUpdateRequestMimeType);
		file.setIndexableText(indexableText);
		file.setLastViewedByMeDate(filesUpdateRequestLastViewedByMeDate);
		file.setMarkedViewedByMeDate(filesUpdateRequestMarkedViewedByMeDate);
		file.setModifiedDate(filesUpdateRequestModifiedDate);
		file.setWritersCanShare(filesUpdateRequestWritersCanShare);
   	
    	ffhttp_GoogleDriveFiles.UpdateRequest request = files.updateRequest(file, filesUpdateRequestFileBody);
    	
		if (!String.isEmpty(filesUpdateRequestAddParents))
		{
			request.setAddParents(filesUpdateRequestAddParents);
		}
	
    	if (filesUpdateRequestConvert != null)
    	{
    		request.setConvert(filesUpdateRequestConvert);
    	}
    	
    	if (filesUpdateRequestNewRevision != null)
    	{
    		request.setConvert(filesUpdateRequestNewRevision);
    	}
		
		if (filesUpdateRequestOcr != null)
		{
			request.setOcr(filesUpdateRequestOcr);
		}
		
		if (!String.isEmpty(filesUpdateRequestOcrLanguage))
		{
			request.setOcrLanguage(filesUpdateRequestOcrLanguage);
		}
		
		if (filesUpdateRequestPinned != null)
		{
			request.setPinned(filesUpdateRequestPinned);
		}
		
		if (!String.isEmpty(filesUpdateRequestRemoveParents))
		{
			request.setRemoveParents(filesUpdateRequestRemoveParents);
		}
		
		if (filesUpdateRequestSetModifiedDate != null)
		{
			request.setSetModifiedDate(filesUpdateRequestSetModifiedDate);
		}
		
		if (!String.isEmpty(filesUpdateRequestTimedTextLanguage))
		{
			request.setTimedTextLanguage(filesUpdateRequestTimedTextLanguage);
		}
		
		if (!String.isEmpty(filesUpdateRequestTimedTextTrackName))
		{
			request.setTimedTextTrackName(filesUpdateRequestTimedTextTrackName);
		}
		
		if (filesUpdateRequestUpdateViewedDate != null)
		{
			request.setUpdateViewedDate(filesUpdateRequestUpdateViewedDate);
		}
		
		if (filesUpdateRequestUseContentAsIndexableText != null)
		{
			request.setUseContentAsIndexableText(filesUpdateRequestUseContentAsIndexableText);
		}
		
    	addFieldsParam(request, filesUpdateRequestFields);
    	execute(request);
    }
    
    public void filesWatchRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null
          || stringValueNotSet('Files', 'File Id', filesWatchRequestFileId))
        {
        	return;
        }
        
        ffhttp_GoogleDriveModelWatch watch = new ffhttp_GoogleDriveModelWatch();
        watch.setId(filesWatchRequestId);
        watch.setToken(filesWatchRequestToken);
        watch.setExpiration(filesWatchRequestExpiration);
        watch.setType(filesWatchRequestType);
        watch.setAddress(filesWatchRequestAddress);
       	
        ffhttp_GoogleDriveFiles.WatchRequest request = files.watchRequest(filesWatchRequestFileId, watch);
        addFieldsParam(request, filesWatchRequestFields);
        execute(request);
    }
    
    public void filesTouchRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null
         || stringValueNotSet('Files', 'File Id', filesTouchRequestId))
		{
			return;
		}
		
		ffhttp_GoogleDriveFiles.TouchRequest request = files.touchRequest(filesTouchRequestId);
    	addFieldsParam(request, filesTouchRequestFields);
    	execute(request);
    }
    
    public void filesTrashRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null
         || stringValueNotSet('Files', 'File Id', filesTrashRequestId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveFiles.TrashRequest request = files.trashRequest(filesTrashRequestId);
    	addFieldsParam(request, filesTrashRequestFields);
    	execute(request);
    }
    
    public void filesUntrashRequest()
    {
    	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null
         || stringValueNotSet('Files', 'File Id', filesUntrashRequestId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveFiles.UntrashRequest request = files.untrashRequest(filesUntrashRequestId);
    	addFieldsParam(request, filesUntrashRequestFields);
    	execute(request);
    }
    
    public void filesEmptyTrashRequest()
    {
   	 	ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
        if (files == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveFiles.EmptyTrashRequest request = files.emptyTrashRequest();
    	execute(request);
    }
    
    public ffhttp_GoogleDriveFiles createGoogleDriveFiles()
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
       ffhttp_GoogleDrive gd = createGoogleDrive();
        return (ffhttp_GoogleDriveFiles)gd.files();    
    }
    
    /**
     * Parents Requests
     */
    public void parentsDeleteRequest()
    {
    	ffhttp_GoogleDriveParents parents = createGoogleDriveParents(parentsDeleteRequestFileId);
        if (parents == null
         || stringValueNotSet('Parents', 'Parent Id', parentsDeleteRequestParentId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveParents.DeleteRequest request = parents.deleteRequest(parentsDeleteRequestParentId);
    	addFieldsParam(request, parentsDeleteRequestFields);
    	execute(request);
    }
    
    public void parentsGetRequest()
    {
    	ffhttp_GoogleDriveParents parents = createGoogleDriveParents(parentsGetRequestFileId);
        if (parents == null
         || stringValueNotSet('Parents', 'Parent Id', parentsGetRequestParentId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveParents.GetRequest request = parents.getRequest(parentsGetRequestParentId);
    	addFieldsParam(request, parentsGetRequestFields);
    	execute(request);
    }
    
    public void parentsInsertRequest()
    {
    	ffhttp_GoogleDriveParents parents = createGoogleDriveParents(parentsInsertRequestFileId);
        if (parents == null
         || stringValueNotSet('Parents', 'Parent Id', parentsInsertRequestParentId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveModelParent parent = new ffhttp_GoogleDriveModelParent();
    	parent.setId(parentsInsertRequestParentId);
	
    	ffhttp_GoogleDriveParents.InsertRequest request = parents.insertRequest(parent);
    	addFieldsParam(request, parentsInsertRequestFields);
    	execute(request);
    }
    
    public void parentsListRequest()
    {
    	ffhttp_GoogleDriveParents parents = createGoogleDriveParents(parentsListRequestFileId);
        if (parents == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDriveParents.ListRequest request = parents.listRequest();
    	addFieldsParam(request, parentsListRequestFields);
    	execute(request);
    }
    
    public ffhttp_GoogleDriveParents createGoogleDriveParents(String parentsFileId)
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
    	if (stringValueNotSet('Parents', 'File Id', parentsFileId))
    	{
    		return null;
    	}
    	
        ffhttp_GoogleDrive gd = createGoogleDrive();
        ffhttp_GoogleDriveParents parents = gd.parents();    
        
        ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
    	file.setId(parentsFileId);
    	parents.setFile(file);
    	
    	return parents;
    }
    
    /**
     * Permissions Requests
     */
    public void permissionsDeleteRequest()
    {
    	ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions(permissionsDeleteRequestFileId);
        if (permissions == null
         || stringValueNotSet('Permissions', 'Permission Id', permissionsDeleteRequestPermissionId))
		{
			return;
		}
    	
    	ffhttp_GoogleDrivePermissions.DeleteRequest request = permissions.deleteRequest(permissionsDeleteRequestPermissionId);
    	addFieldsParam(request, permissionsDeleteRequestFields);
    	execute(request);
    }
    
    public void permissionsGetRequest()
    {
    	ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions(permissionsGetRequestFileId);
        if (permissions == null
         || stringValueNotSet('Permissions', 'Permission Id', permissionsGetRequestPermissionId))
		{
			return;
		}
    	
    	ffhttp_GoogleDrivePermissions.GetRequest request = permissions.getRequest(permissionsGetRequestPermissionId);
    	addFieldsParam(request, permissionsGetRequestFields);
    	execute(request);
    }
    
    public void permissionsGetIdForEmailRequest()
    {
    	ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions(null, false);
        if (permissions == null
         || stringValueNotSet('Permissions', 'Email', permissionsGetIdForEmailRequestEmail))
		{
			return;
		}
    	
    	ffhttp_GoogleDrivePermissions.GetIdForEmailRequest request = permissions.getIdForEmailRequest(permissionsGetIdForEmailRequestEmail);
    	addFieldsParam(request, permissionsGetIdForEmailRequestFields);
    	execute(request);
    }
    
    public void permissionsInsertRequest()
    {
    	ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions(permissionsInsertRequestFileId);
        if (permissions == null)
		{
			return;
		}
		
		if (!String.isEmpty(permissionsInsertRequestPermissionId) && !String.isEmpty(permissionsInsertRequestValue))
		{
			error('Permissions: You must set either the permission id or value.');
			return;
		}
    	
    	ffhttp_GoogleDriveModelPermission permission = new ffhttp_GoogleDriveModelPermission();
    	permission.setRole(permissionsInsertRequestRole);
    	permission.setType(permissionsInsertRequestType);
    	permission.setAdditionalRoles(permissionsInsertRequestAdditionalRoles);
    	
    	if (!String.isEmpty(permissionsInsertRequestPermissionId))
    	{
    		permission.setId(permissionsInsertRequestPermissionId);
    	}
    	
    	if (!String.isEmpty(permissionsInsertRequestValue))
    	{
    		permission.setValue(permissionsInsertRequestValue);
    	}
    	permission.setWithLink(permissionsInsertRequestWithLink);
    	
    	ffhttp_GoogleDrivePermissions.InsertRequest request = permissions.insertRequest(permission);
    	
    	if (!String.isEmpty(permissionsInsertRequestEmailMessage))
    	{
    		request.setEmailMessage(permissionsInsertRequestEmailMessage);	
    	}
    	
    	if (permissionsInsertRequestSendNotificationEmails != null)
    	{
    		request.setSendNotificationEmails(permissionsInsertRequestSendNotificationEmails);
    	}
    	
    	addFieldsParam(request, permissionsInsertRequestFields);
    	execute(request);
    }
    
    public void permissionsListRequest()
    {
    	ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions(permissionsListRequestFileId);
        if (permissions == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDrivePermissions.ListRequest request = permissions.listRequest();
    	addFieldsParam(request, permissionsListRequestFields);
    	execute(request);
    }
    
    public void permissionsUpdateRequest()
    {
    	ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions(permissionsUpdateRequestFileId);
        if (permissions == null
         || stringValueNotSet('Permissions', 'Permission Id', permissionsUpdateRequestPermissionId))
		{
			return;
		}
    	
    	ffhttp_GoogleDriveModelPermission permission = new ffhttp_GoogleDriveModelPermission();
    	permission.setId(permissionsUpdateRequestPermissionId);
    	permission.setRole(permissionsUpdateRequestRole);
    	permission.setAdditionalRoles(permissionsUpdateRequestAdditionalRoles);
    	
    	ffhttp_GoogleDrivePermissions.UpdateRequest request = permissions.updateRequest(permission);
    	
    	if (permissionsUpdateRequestTransferOwnership != null)
    	{
    		request.setTransferOwnership(permissionsUpdateRequestTransferOwnership);
    	}
    	
    	addFieldsParam(request, permissionsUpdateRequestFields);
    	execute(request);
    }
    
    public ffhttp_GoogleDrivePermissions createGoogleDrivePermissions(String permissionsFileId)
    {
    	return createGoogleDrivePermissions(permissionsFileId, true);
    }
    public ffhttp_GoogleDrivePermissions createGoogleDrivePermissions(String permissionsFileId, boolean fileRequired)
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
    	ffhttp_GoogleDrive gd = createGoogleDrive();
        ffhttp_GoogleDrivePermissions permissions = gd.permissions();   
    	
    	if (!fileRequired)
    	{
    		return permissions;
    	}
    	
		if (stringValueNotSet('Permissions', 'File Id', permissionsFileId))
		{
		 	return null;
		}
		
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId(permissionsFileId);
		permissions.setFile(file);
    	return permissions;
    }
    
    /**
     * Properties Requests
     */
   	public void propertiesDeleteRequest()
   	{
   		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties(propertiesDeleteRequestFileId);
        if (properties == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveProperties.DeleteRequest request = properties.deleteRequest(propertiesDeleteRequestPropertyKey);
		
		if (!String.isEmpty(propertiesDeleteRequestVisibility))
		{
			request.setVisibility(propertiesDeleteRequestVisibility);
		}
		
		addFieldsParam(request, propertiesGetRequestFields);
    	execute(request);
   	}
   	
   	public void propertiesGetRequest()
   	{
   		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties(propertiesGetRequestFileId);
        if (properties == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveProperties.GetRequest request = properties.getRequest(propertiesGetRequestPropertyKey);
		
		if (!String.isEmpty(propertiesGetRequestVisibility))
		{
			request.setVisibility(propertiesGetRequestVisibility);
		}
		
    	addFieldsParam(request, propertiesGetRequestFields);
    	execute(request);
   	}
   	
   	public void propertiesInsertRequest()
   	{
   		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties(propertiesInsertRequestFileId);
        if (properties == null)
		{
			return;
		}
   							
   		ffhttp_GoogleDriveModelProperty property = new ffhttp_GoogleDriveModelProperty();
   		property.setKey(propertiesInsertRequestPropertyKey);
   		property.setValue(propertiesInsertRequestValue);
   		property.setVisibility(propertiesInsertRequestVisibility);
   		
   		ffhttp_GoogleDriveProperties.InsertRequest request = properties.insertRequest(property);
   		addFieldsParam(request, propertiesInsertRequestFields);
    	execute(request);
   	}
   	
   	public void propertiesListRequest()
   	{
   		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties(propertiesListRequestFileId);
        if (properties == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDriveProperties.ListRequest request = properties.listRequest();
    	addFieldsParam(request, propertiesListRequestFields);
    	execute(request);
   	}
   	
   	public void propertiesUpdateRequest()
   	{
   		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties(propertiesUpdateRequestFileId);
        if (properties == null)
		{
			return;
		}
						
   		ffhttp_GoogleDriveModelProperty property = new ffhttp_GoogleDriveModelProperty();
   		property.setKey(propertiesUpdateRequestPropertyKey);
   		property.setValue(propertiesUpdateRequestValue);
   		property.setVisibility(propertiesUpdateRequestVisibility);
   		
   		ffhttp_GoogleDriveProperties.UpdateRequest request = properties.updateRequest(property);
   		
   		if (!String.isEmpty(propertiesUpdateRequestVisibility))
   		{
   			request.setVisibility(propertiesUpdateRequestVisibility);
   		}
   		
    	addFieldsParam(request, propertiesUpdateRequestFields);
    	execute(request);
   	}
   	
   	public ffhttp_GoogleDriveProperties createGoogleDriveProperties(String propertiesFileId)
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
    	if (stringValueNotSet('Properties', 'File Id', propertiesFileId))
		{
		 	return null;
		}
    	
    	ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
    	file.setId(propertiesFileId);
    	
        ffhttp_GoogleDrive gd = createGoogleDrive();
        ffhttp_GoogleDriveProperties properties = gd.properties();   
        properties.setFile(file);
        return properties; 
    }
    
    /**
     * Replies Requests
     */
   	public void repliesDeleteRequest()
   	{
   		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies(repliesDeleteRequestFileId, repliesDeleteRequestCommentId);
        if (replies == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveReplies.DeleteRequest request = replies.deleteRequest(repliesDeleteRequestReplyId);
		addFieldsParam(request, repliesGetRequestFields);
    	execute(request);
   	}
   	
   	public void repliesGetRequest()
   	{
   		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies(repliesGetRequestFileId, repliesGetRequestCommentId);
        if (replies == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveReplies.GetRequest request = replies.getRequest(repliesGetRequestReplyId);
		
		if (repliesGetRequestIncludeDeleted != null)
		{
			request.setIncludeDeleted(repliesGetRequestIncludeDeleted);	
		}
		
    	addFieldsParam(request, repliesGetRequestFields);
    	execute(request);
   	}
   	
   	public void repliesInsertRequest()
   	{
   		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies(repliesInsertRequestFileId, repliesInsertRequestCommentId);
        if (replies == null)
		{
			return;
		}
   							
   		ffhttp_GoogleDriveModelReply reply = new ffhttp_GoogleDriveModelReply();
   		reply.setContent(repliesInsertRequestContent);
   		reply.setVerb(repliesInsertRequestVerb);
   		
   		ffhttp_GoogleDriveReplies.InsertRequest request = replies.insertRequest(reply);
    	addFieldsParam(request, repliesInsertRequestFields);
    	execute(request);
   	}
   	
   	public void repliesListRequest()
   	{
   		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies(repliesListRequestFileId, repliesListRequestCommentId);
        if (replies == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDriveReplies.ListRequest request = replies.listRequest();
    	addFieldsParam(request, repliesListRequestFields);
    	execute(request);
   	}
   	
   	public void repliesUpdateRequest()
   	{
   		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies(repliesUpdateRequestFileId, repliesUpdateRequestCommentId);
        if (replies == null)
		{
			return;
		}
   							
   		ffhttp_GoogleDriveModelReply reply = new ffhttp_GoogleDriveModelReply();
   		reply.setReplyId(repliesUpdateRequestReplyId);
   		reply.setContent(repliesUpdateRequestContent);
   		reply.setVerb(repliesUpdateRequestVerb);
   		
   		ffhttp_GoogleDriveReplies.UpdateRequest request = replies.updateRequest(reply);
    	addFieldsParam(request, repliesUpdateRequestFields);
    	execute(request);
   	}
   	
   	public ffhttp_GoogleDriveReplies createGoogleDriveReplies(String repliesFileId, String repliesCommentId)
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
    	if (stringValueNotSet('Replies', 'File Id', repliesFileId)
    	  || stringValueNotSet('Replies', 'Comment Id', repliesCommentId))
		{
		 	return null;
		}
    	
    	ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
    	file.setId(repliesFileId);
    	
    	ffhttp_GoogleDriveModelComment comment = new ffhttp_GoogleDriveModelComment();
    	comment.setCommentId(repliesCommentId);
    	
        ffhttp_GoogleDrive gd = createGoogleDrive();
        ffhttp_GoogleDriveReplies replies = gd.replies();   
        replies.setFile(file);
        replies.setComment(comment);
        return replies; 
    }
    
    /**
     * Revisions Requests
     */
   	public void revisionsDeleteRequest()
   	{
   		ffhttp_GoogleDriveRevisions revisions = createGoogleDriveRevisions(revisionsDeleteRequestFileId);
        if (revisions == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveRevisions.DeleteRequest request = revisions.deleteRequest(revisionsDeleteRequestRevisionId);
		addFieldsParam(request, revisionsGetRequestFields);
    	execute(request);
   	}
   	
   	public void revisionsGetRequest()
   	{
   		ffhttp_GoogleDriveRevisions revisions = createGoogleDriveRevisions(revisionsGetRequestFileId);
        if (revisions == null)
		{
			return;
		}
		
		ffhttp_GoogleDriveRevisions.GetRequest request = revisions.getRequest(revisionsGetRequestRevisionId);
		addFieldsParam(request, revisionsGetRequestFields);
    	execute(request);
   	}
   	
   	public void revisionsListRequest()
   	{
   		ffhttp_GoogleDriveRevisions revisions = createGoogleDriveRevisions(revisionsListRequestFileId);
        if (revisions == null)
		{
			return;
		}
    	
    	ffhttp_GoogleDriveRevisions.ListRequest request = revisions.listRequest();
    	addFieldsParam(request, revisionsListRequestFields);
    	execute(request);
   	}
   	
   	public void revisionsUpdateRequest()
   	{
   		ffhttp_GoogleDriveRevisions revisions = createGoogleDriveRevisions(revisionsUpdateRequestFileId);
        if (revisions == null)
		{
			return;
		}
   							
   		ffhttp_GoogleDriveModelRevision revision = new ffhttp_GoogleDriveModelRevision();
   		revision.setId(revisionsUpdateRequestRevisionId);
   		revision.setPinned(revisionsUpdateRequestPinned);
   		revision.setPublished(revisionsUpdateRequestPublished);
   		revision.setPublishAuto(revisionsUpdateRequestPublishAuto);
   		revision.setPublishedOutsideDomain(revisionsUpdateRequestPublishedOutsideDomain);
   		
   		ffhttp_GoogleDriveRevisions.UpdateRequest request = revisions.updateRequest(revision);
    	addFieldsParam(request, revisionsUpdateRequestFields);
    	execute(request);
   	}
   	
   	public ffhttp_GoogleDriveRevisions createGoogleDriveRevisions(String revisionsFileId)
    {
    	if (!checkAuthorized())
    	{
    		return null;
    	}
    	
    	if (stringValueNotSet('Revisions', 'File Id', revisionsFileId))
		{
		 	return null;
		}
    	
    	ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
    	file.setId(revisionsFileId);
    	    	
        ffhttp_GoogleDrive gd = createGoogleDrive();
        ffhttp_GoogleDriveRevisions revisions = gd.revisions();   
        revisions.setFile(file);
        return revisions; 
    }
    
    private ffhttp_GoogleDrive createGoogleDrive()
    {
    	String tokenType = connectorService.connector.TokenType__c;
    	String accessToken = connectorService.connector.AccessToken__c;
    	
  		ffhttp_Client.ICredentials credentials = new ffhttp_Client.AccessTokenCredentials(tokenType, accessToken);
        return new ffhttp_GoogleDrive(credentials);	
    }
    
    /**
     * Helper methods
     */
    private void error(String message) 
    {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, message));
    }
    
    private void info(String message) 
    {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, message));
    }
    
    private void addFieldsParam(ffhttp_GoogleDriveResource.GoogleDriveRequest request, String requestFields)
    {
    	if (!String.isEmpty(requestFields))
    	{
    		request.setFields(requestFields);
    	}
    }
    
    private void execute(ffhttp_Client.AbstractClientRequest request) 
    {
        try
        {
            HttpRequest httpRequest = request.buildHttpRequest();
            
            String body = httpRequest.getBody();
            Blob b = httpRequest.getBodyAsBlob();
            if (b != null)
            {
            	body = 'Body consists of blob data';
            }
            
            request.buildHttpRequest();
            
            info('Request: Endpoint: ' + httpRequest.getEndpoint() + ' Body: ' + body);
        
            HttpResponse response = request.executeUnparsed();
            info('Response: Status: ' + response.getStatus() + ' Body: ' + response.getBody());
        }
        catch (Exception ex)
        {
            error('Error whilst processing request: ' + ex.getMessage());
        }    
    }
    
    private Boolean checkAuthorized()
	{
		if (connectorService == null)
		{
			return false;
		}
		
		String validConnector = connectorService.validateConnector();
		if (!String.isEmpty(validConnector))
		{
			error(validConnector);
		}
		
		return String.isEmpty(validConnector);
	}
	
	private Boolean stringValueNotSet(String calloutSection, String name, String value)
	{
		if (String.isEmpty(value))
		{
			error(calloutSection + ': ' + name + ' must be set.');
			return true;
		}
		return false;
	}
    
    /**
     * List methods
     */
     
     /**
	 * List methods
	 */
	public List<SelectOption> getFileDomainTypes() 
    {
    	List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(ffhttp_GoogleDriveFiles.CORPUS_DEFAULT, 'Default'));
        options.add(new SelectOption(ffhttp_GoogleDriveFiles.CORPUS_DOMAIN, 'Domain'));
        return options;
   	}  	  	
   	public List<SelectOption> getFileVisibilityTypes()
   	{
   		List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(ffhttp_GoogleDriveFiles.VISIBILITY_DEFAULT, 'Default'));
        options.add(new SelectOption(ffhttp_GoogleDriveFiles.VISIBILITY_PRIVATE, 'Private'));
        return options;
   	}
   	public List<SelectOption> getPermissionAdditionalRoles()
   	{
   		List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(ffhttp_GoogleDriveModelPermission.PERMISSION_ROLE_COMMENTER, 'Commenter'));
       	return options;
   	}
   	public List<SelectOption> getPermissionRoles()
   	{
   		List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(ffhttp_GoogleDriveModelPermission.PERMISSION_ROLE_OWNER, 'Owner'));
        options.add(new SelectOption(ffhttp_GoogleDriveModelPermission.PERMISSION_ROLE_READER, 'Reader'));
        options.add(new SelectOption(ffhttp_GoogleDriveModelPermission.PERMISSION_ROLE_WRITER, 'Writer'));
        return options;
   	}
   	public List<SelectOption> getPermissionTypes()
   	{
   		List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(ffhttp_GoogleDriveModelPermission.PERMISSION_TYPE_USER, 'User'));
        options.add(new SelectOption(ffhttp_GoogleDriveModelPermission.PERMISSION_TYPE_GROUP, 'Group'));
        options.add(new SelectOption(ffhttp_GoogleDriveModelPermission.PERMISSION_TYPE_DOMAIN, 'Domain'));
        options.add(new SelectOption(ffhttp_GoogleDriveModelPermission.PERMISSION_TYPE_ANYONE, 'Anyone'));
        return options;
   	}
   	public List<SelectOption> getReplyActions()
   	{
   		List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(ffhttp_GoogleDriveModelReply.VERB_RESOLVE, 'Resolve'));
        options.add(new SelectOption(ffhttp_GoogleDriveModelReply.VERB_REOPEN, 'Reopen'));
        return options;
   	}
}
