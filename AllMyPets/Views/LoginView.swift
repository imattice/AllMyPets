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
    @State var showAlert = false
    
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
                        showAlert = true
                    }
                },
                       label: {
                        Text("Sign In")
                            .font(.largeTitle)
                })
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("User Lookup"),
                          message: Text("No user found for \(name)"),
                          dismissButton: .default(Text("Ok")))
                })
                NavigationLink(
                    destination: NewUserView(),
                    label: {
                        Text("Create Account")
                    })
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
