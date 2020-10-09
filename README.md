# AllMyPets
A sample project used to leverage the UnifyID API


AllMyPets uses an Authentication Service to access various parts of the application using UnifyID authentication.  This is implemented in three parts of the application:

* New Users - New users are verified once they enter a username and select the "done" button.  When this view is shown, the app generates a token using HumanDetect that monitors if the user is a human or a bot. Once the "Done" button is selected, that token is sent to the UnifyID API to authenticate.  If the token is determined to be human, the app will navigate back to the login screen.  Otherwise, an alert will prompt the user that the user creation was unsuccessful.
* Walk Access - To view the walks for each pet, the app authorizes the user based on their walking patterns using GaitAuth. When on this page, the user would tap a button to authorize access to view the walks.  This features is partially implemented as training the model would take time (at least 7 days).  However, the foundation of the SDK is implemented and should work were a user to regularly use this app and take the time to train the model.
* Initial Login - Logging in would require a push notification authorization using PushAuth.  Enabling Push Notifications requires a paid Apple developer account and is not currently implemented


