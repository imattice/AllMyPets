//
//  PetListView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct PetListView: View {
    var body: some View {
        VStack {
            List {
                HStack {
                    Image(systemName: "tortoise")
                    Text("Tiptoe")
                }
            }
        }
    }
}

struct PetListView_Previews: PreviewProvider {
    static var previews: some View {
        PetListView()
    }
}
