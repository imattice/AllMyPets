//
//  ContentView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct LoginView: View {
    @State var name: String = ""
    @State var isLoggedIn = false
    @State var isShowingAlert = false
    @State var isShowingNewUserView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TextField("Username", text: $name)
                    .padding()
                NavigationLink(
                    destination: PetListView(),
                    isActive: $isLoggedIn,
                    label: { EmptyView()})
                
                Button(action: {
                    do {
                        try AuthenticationService.shared.login(name)
                        isLoggedIn = true
                    } catch {
                        isShowingAlert = true
                    }
                },
                       label: {
                        Text("Sign In")
                            .font(.largeTitle)
                })
                NavigationLink(
                    destination: NewUserView(isShowingNewUserView: $isShowingNewUserView),
                    isActive: $isShowingNewUserView,
                    label: {
                        Text("Create Account")
                    })
                Spacer()
            }
        }
        .alert(isPresented: $isShowingAlert, content: {
            Alert(title: Text("User Lookup"),
                  message: Text("No user found for \(name)"),
                  dismissButton: .default(Text("Ok")))
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
