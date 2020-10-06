//
//  DogWalkView.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import SwiftUI

struct WalksView: View {
    var body: some View {
        List {
            HStack {
                Image(systemName: "map")
                    .padding()
                VStack(alignment: .leading) {
                    Text("Home")
                    HStack {
                        Image(systemName: "arrow.turn.down.right")
                        Text("Dog Park")
                    }
                }
                Spacer()
                Text("30 minutes")
            }
        }
    }
}

struct DogWalkView_Previews: PreviewProvider {
    static var previews: some View {
        WalksView()
    }
}
