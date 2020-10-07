//
//  User.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import Foundation

struct User {
    let id: UUID
    let name: String
    let pets: [Pet]
    
    static var current: User? = nil
    
//    init(id: UUID?, name: String, pets: [Pet] = [Pet]()) {
//        self.name   = name
//        self.pets   = pets
//        self.id     = id ?? UUID()
//    }

}
