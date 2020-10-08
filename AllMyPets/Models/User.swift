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
    
    static var randomSampleUsername: String {
        let randomIndex = Int.random(in: 0...(sampleUsers.count - 1))
        return sampleUsers[randomIndex].name
    }
    
//    init(id: UUID?, name: String, pets: [Pet] = [Pet]()) {
//        self.name   = name
//        self.pets   = pets
//        self.id     = id ?? UUID()
//    }

}
