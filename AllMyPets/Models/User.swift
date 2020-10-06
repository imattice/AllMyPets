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
    
    static var current: User? = nil
}
