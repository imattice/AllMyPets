//
//  PetListView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct PetListView: View {
    var pets: [Pet] { User.current?.pets ?? [Pet]() }
    
    var body: some View {
        VStack {
            List {
                ForEach(pets, id: \.self) { pet in
                    NavigationLink(
                        destination: WalksView(pet: pet),
                        label: {
                            PetView(pet: pet)
                        })
                }
            }
        }
        .navigationTitle("My Pets")
    }
}

struct PetListView_Previews: PreviewProvider {
    
    static var previews: some View {
        PetListView()
    }
}

struct PetView: View {
    @State var pet: Pet
    
    var body: some View {
        HStack {
            Image(pet.type.rawValue)
            Text(pet.name)
        }
    }
}
