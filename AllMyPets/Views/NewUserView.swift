//
//  NewUserView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct NewUserView: View {
    @State var name: String = ""
    @State var isShowingAlert: Bool = false
    @State var isUserVerified: Bool = false
    ///tracks if the NewUserView is showing.  Setting this to false will dismiss this view and return the UI to the LoginView
    @Binding var isShowingNewUserView: Bool
    
    var body: some View {
        VStack {
            ///the form used to collect information to create a user
            Form {
                TextField("Username", text: $name)
            }
            
            ///completes the form and verifies the user is not a bot
            Button(action: {
                do {
                    ///try to verify the user is not created by a bot
                    ///if successful, show an alert letting the user know
                    try AuthenticationService.shared.verifyNewUser(name) { isVerified in
                        isUserVerified = isVerified
                        isShowingAlert = true
                    }
                }
                ///if the verfication fails
                ///show an alert letting the user know the verification failed
                catch {
                    isUserVerified = false
                    isShowingAlert = true
                }
            },
                   label: {
                    Text("Done")
                        .font(.largeTitle)
            })
            .alert(isPresented: $isShowingAlert, content: {
                VerifiedAlert
            })
        }
        .onAppear {
            AuthenticationService.shared.startHumanVerification()
        }
        .onDisappear{
            AuthenticationService.shared.stopHumanVerification()
        }
    }
    ///conditionally return a success alert or a failure alert based on the "isUserVerified" property
    private var VerifiedAlert: Alert {
        if isUserVerified {
           return Alert(title: Text("New User Added!"),
                  message: Text("You are not a bot and can now track your pets (once that feature has been implemented for new users)"),
                  dismissButton:
                    .default(Text("Ok"),
                             action: {
                                ///send the user back to the login screen once they have successfully added a new user
                                self.isShowingNewUserView = false
                             }))
        } else {
           return  Alert(title: Text("Could not add New User"),
                  message: Text("Sorry!  You might be a robot."),
                  dismissButton: .default(Text("Ok")))
        }
    }

}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView(isShowingNewUserView: .constant(true))
    }
}
