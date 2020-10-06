//
//  NewUserView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct NewUserView: View {
    @State var name: String = ""
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $name)
            }
            Button(action: {
                print("Finished User")
            },
            label: {
                Text("Done")
            }).padding()
        }
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}
