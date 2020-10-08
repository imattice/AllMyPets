//
//  PetListView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct PetListView: View {
    var pets: [Pet] { User.current?.pets ?? [Pet]() }
    @State var isAuthorized: Bool = false
    @State var selectedPet: Pet = Pet(name: "fake", type: .fish, walks: [Walk]())
    
    var body: some View {
        VStack {
            List {
                ForEach(pets, id: \.self) { pet in
                    Button(action: {
                        print("authenticating")
                        selectedPet = pet
                        isAuthorized = true
                    }, label: {
                        PetView(pet: pet, isAuthorized: isAuthorized)
                    })
                }
            }
            NavigationLink(
                destination: WalksView(pet: selectedPet),
                isActive: $isAuthorized,
                label: { EmptyView() })
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
    @State var isAuthorized: Bool
    
    var body: some View {
        HStack {
            Image(pet.type.rawValue)
            Text(pet.name)
            Spacer()
            isAuthorized ?
                Image(systemName: "lock.open") :
                Image(systemName: "lock.fill")
            Image(systemName: "chevron.right")
            
        }
    }
}
