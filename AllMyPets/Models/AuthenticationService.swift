//
//  LoginService.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import Foundation
import UnifyID

///A shared service used to authenticate users
struct AuthenticationService {
    ///a shared instance of the AuthService used throughout the app
    static let shared: AuthenticationService = AuthenticationService()

    ///used to access UnifyID SDK
    let unifyid : UnifyID = { try! UnifyID(
        sdkKey: Keys.sdkKey,
        user: User.current?.id.uuidString
    )}()
    
    //enabling push notification requires a paid apple account
    //stopped at step 3 of push auth setup: https://developer.unify.id/docs/pushauth/sdk-setup/
    func login(_ name: String) throws {
        guard let newUser = sampleUsers.filter({ $0.name.lowercased() == name.lowercased() }).first else {
            throw AuthenticationError.loginError("no user found for \(name)") }
            
        User.current = newUser
    }
    
    func verifyNewUser() {
        
    }
    
    func authenticateWalkAccess() {
        
    }
    
    enum AuthenticationError: Error {
        case loginError(String)
    }
}
