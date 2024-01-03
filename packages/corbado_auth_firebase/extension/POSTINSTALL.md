# Finalizing Installation

## Grant the Service Account Token Creator IAM role

The functions created by this extension need to be able to create service account tokens.
If you want to learn more about the concept of custom tokens, please refer to the [Firebase documentation](https://firebase.google.com/docs/auth/admin/create-custom-tokens).

To allow that follow these steps:
1. Go to [IAM and admin](https://console.cloud.google.com/project/_/iam-admin) in the Google Cloud Console.
2. Select your project and click "Continue".
3. Search for the service account that controls the rights of the cloud functions created by the extension. 
   It should be named **ext-authentication-corbado@{project-name}.iam.gserviceaccount.com**.
4. Start editing this service account by clicking on the "edit" icon and then click on "add another role".
5. Search for "Service Account Token Creator" and select it.
6. Click "Save" to confirm the role grant.
