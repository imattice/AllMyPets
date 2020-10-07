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
    
    var body: some View {
        VStack {
            Form {
                TextField("Username", text: $name)
            }
            
            Button(action: {
                do {
                    try AuthenticationService.shared.verifyNewUser(name) { isVerified in
                        isUserVerified = isVerified
                        isShowingAlert = true
                    }
                } catch {
                    isUserVerified = false
                    isShowingAlert = true
                }
            },
                   label: {
                    Text("Done")
                        .font(.largeTitle)
            })
            .alert(isPresented: $isShowingAlert, content: {
                if isUserVerified {
                   return Alert(title: Text("New User Added!"),
                          message: Text("You are not a bot and can now track your pets"),
                          dismissButton: .default(Text("Ok")))
                } else {
                   return  Alert(title: Text("Could not add New User"),
                          message: Text("Sorry!  You might be a robot."),
                          dismissButton: .default(Text("Ok")))
                }
            })
        }
        .onAppear {
            AuthenticationService.shared.startHumanVerification()
        }
        .onDisappear{
            AuthenticationService.shared.stopHumanVerification()
        }
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}
