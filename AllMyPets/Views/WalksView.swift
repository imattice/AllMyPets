//
//  DogWalkView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct WalksView: View {
    @State var pet: Pet
    
    var body: some View {
        VStack {
            if pet.walks.isEmpty{ Text("Aw!  Go for a walk with \(pet.name)!")} else {
        List {
            ForEach(pet.walks, id: \.self) { walk in
                WalkCellView(walk: walk)
            }
        }
        .navigationTitle("\(pet.name)'s Walks")
        }
    }
}
}
struct DogWalkView_Previews: PreviewProvider {
    static var previews: some View {
        WalksView(pet: Pet(name: "Rubick",
                           type: .dog,
                           walks: [
                            Walk(startLocation: "Home",
                                 destinationLocation: "Grocery Store",
                                 time: "20 Minutes"),
                            Walk(startLocation: "Home",
                                 destinationLocation: "Work",
                                 time: "30 Minutes"),
                            Walk(startLocation: "Park",
                                 destinationLocation: "Ben's House",
                                 time: "40 Minutes"),
                            Walk(startLocation: "Home",
                                 destinationLocation: "Grocery Store",
                                 time: "10 Minutes"),
                           ]))
    }
}

struct WalkCellView: View {
    @State var walk: Walk
    var body: some View {
        HStack {
            Image(systemName: "map")
                .padding()
            VStack(alignment: .leading) {
                Text(walk.startLocation)
                HStack {
                    Image(systemName: "arrow.turn.down.right")
                    Text(walk.destinationLocation)
                }
            }
            Spacer()
            Text(walk.time)
        }
    }
}
