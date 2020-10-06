//
//  ContentView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct LoginView: View {
    @State var name: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Name", text: $name)
                .padding()
            Button( action: {
                print("logging in")
            },
            label: {
                Text("Sign In")
                    .font(.largeTitle)
            })
            .padding(.bottom)

            
            Button( action: {
                print("logging in")
            },
            label: {
                Text("Create Account")
            })
            Spacer()

    }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
