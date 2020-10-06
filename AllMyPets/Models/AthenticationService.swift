//
//  LoginService.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import Foundation
import UnifyID


struct AuthenticiationService {
    static let shared: AuthenticiationService = AuthenticiationService()

    let unifyid : UnifyID = { try! UnifyID(
        sdkKey: Keys.sdkKey,
        user: User.current?.id.uuidString
    )}()
    
    //enabling push notification requires a paid apple account
    func login() {
        
    }
    
    func verifyNewUser() {
        
    }
    
    func authenticateWalkAccess() {
        
    }
}
