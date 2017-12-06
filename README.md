Google Drive Sample Apps
========================

<a href="https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-googledrive-samples">
    <img alt="Deploy to Salesforce"
        src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

Summary
-------
This app (or collection of apps) has been built to demonstrate the use of the [Google Drive](https://github.com/financialforcedev/ffhttp-googledrive) and [Core](https://github.com/financialforcedev/ffhttp-core) libraries. 

It consists of two components:
1. A test harness that provides a UI for performing all of the Google Drive API calls.
2. An implementation of the library that allows Account attachments to be transferred to Google Drive. 

**Note:** Currently, no test coverage for the sample apps has been provided.

Key Features
------------
+ Demonstrates each of the API calls found at https://developers.google.com/drive/v2/reference/.
+ Demonstrates the use of the [Files: insert](https://developers.google.com/drive/v2/reference/files/insert) API call by moving an Account attachment to Google Drive.
+ Demonstrates the use of the [Permissions : insert](https://developers.google.com/drive/v2/reference/permissions/insert) API call by sharing the transferred file to all the Account contacts.
+ Demonstrates the use of the [Files: delete](https://developers.google.com/drive/v2/reference/files/delete) API call by deleting the file from Google Drive.

Configuration
-------------

This section explains how to configure the Google Drive Sample Apps.

1. Deploy the [Core](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-core) package to your Salesforce organisation.
2. Deploy the [OAuth Sample App](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-core-samples).
3. Deploy the [Google Drive](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-googledrive) package. 
4. Deploy the [Google Drive Sample App](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-googledrive-samples).
5. Go to **Setup** > **Manage Users** > **Users**.
6. Select your user.
7. Select **Edit Assignments** in the **Permission Set Assignments** section.
8. Add the **OAuth Sample App Permissions** and **Google Drive Sample App Permissions** permission sets and **Save**.
9. Select the **Google Drive Sample App** from the app menu. 
    + The **Test Harness**, **Account**, **Connector Types** and **Connectors** tabs should be displayed.
10. Create a Google App following the steps in the **Create an app in Google** section below.
11. Follow the steps in the **Create a Google Drive Connector** section below.
12. Go to **Setup** > **Customize** > **Accounts** > **Page Layouts**.
13. Select **Edit** on the **Account Layout**.
14. Select the **Buttons** section.
15. Add the **Move Attachments to Google Drive** button to the **Custom Buttons** section.
16. Save the layout.
17. Select an account from the **Accounts** tab.
    + The **Move Attachments to Google Drive** button should be displayed.

### Create an app in Google

1. Log in to your Google account.
2. Go to https://console.developers.google.com/project and select **Create Project**.
3. Enter a project name and ok the dialog.
4. Select the hyperlink for the project name that you just created.
5. Select **Credentials**.
6. Select **Create new Client ID**.
7. Select **Web application**.
8. Set the **Authorized Javascript Origins** url to the URL of the Salesforce organisation e.g. https://eu3.salesforce.com.
9. Set the **Authorized Redirect URIs** to the same as above with *apex/connector* appended: e.g. https://eu3.salesforce.com/apex/connector.
10. Make sure you know the **Client Id** and **Client Secret** as they will be needed later.
11. Select the **Consent screen**.
12. Enter a **Product Name** and save.

### Create a Google Drive Connector 
1. Log in to your Salesforce organisation.
2. Go to the **Developer Console** and select **Debug** > **Open Execute Anonymous Window**.
3. Run the following code changing the parameters to the appropriate values:

    ```
    GoogleDriveConfigure.configure(<Google App Client Id>, <Google App Client Secret>, <Salesforce domain>);
    ```

4. Check that the connector has been created and activate it.

Use
---

Once the project is configured:

### Test Harness
1. Select the **Test Harness** tab.
2. Check that you get a message starting with 'Successful authentication'. If you do not, check that all the configuration steps have been peformed correctly.
3. Expand any section to display the API calls, then select **Submit** to test the call.

### Account Transfer Sample App
1. Select the **Accounts** tab and view an account.
2. In the **Notes & Attachments** section select **Attach File**. Choose a file and attach it.
3. Select the **Move Attachments to Google Drive** button.
4. Choose an attachment and select **Transfer**.
5. The attachment will have been transferred to Google Drive.


Reporting Issues & Enhancements
-------------------------------

Please report any issues using the github [issues](https://github.com/financialforcedev/ffhttp-googledrive-samples/issues) feature. Suggestions / bug reports are welcome as are extensions containing additional functionality.
