//
//  Pet.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import Foundation

struct Pet {
    let name: String
    let type: PetType
    let walks: [Walk]
    
    enum PetType {
        case dog, cat, fish, reptile, bird
    }
}
