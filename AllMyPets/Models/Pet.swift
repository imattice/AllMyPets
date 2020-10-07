//
//  Pet.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import Foundation

struct Pet: Hashable {
    static func == (lhs: Pet, rhs: Pet) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type
    }
    
    let name: String
    let type: PetType
    let walks: [Walk]
    
    enum PetType: String {
        case dog, cat, fish, reptile, bird
    }
}
