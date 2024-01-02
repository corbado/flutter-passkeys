# Finalizing Installation
## Grant the Authentication Permissions for the extension

The "**Service Account Token Creator**" IAM roles need to be granted to the service account **ext-justpass-me@{project-name}.iam.gserviceaccount.com** running the extension

1. Open the [IAM and admin](https://console.cloud.google.com/project/_/iam-admin) page in the Google Cloud Console.
2. Select your project and click "Continue".
3. Click the edit icon corresponding to the service account you wish to update.
4. Click on "Add Another Role".
5. Type "Service Account Token Creator" into the search filter, and select it from the results.
6. Click "Save" to confirm the role grant.
