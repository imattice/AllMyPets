//
//  LoginService.swift
//  AllMyPets
//
//  Created by Ike Mattice on 10/6/20.
//

import Foundation
import UnifyID
import HumanDetect

///A shared service used to authenticate users
struct AuthenticationService {
    ///a shared instance of the AuthService used throughout the app
    static var shared: AuthenticationService = AuthenticationService()

    ///used to access UnifyID SDK
    let unifyid : UnifyID = { try! UnifyID(
        sdkKey: Keys.sdkKey,
        user: User.current?.id.uuidString
    )}()
    
    ///used to capture passive verification that the user is human
    var humanDetect: HumanDetect? = nil

    ///start passively capturing human verification
    mutating func startHumanVerification() {
        humanDetect = unifyid.humanDetect
        
        humanDetect!.startPassiveCapture()
    }
    
    mutating func stopHumanVerification() {
        guard let humanDetect = humanDetect else { return }
        
        humanDetect.stopPassiveCapture()
        self.humanDetect = nil
    }
    
    var isVerified: Bool = false
    
    //enabling push notification requires a paid apple account
    //stopped at step 3 of push auth setup: https://developer.unify.id/docs/pushauth/sdk-setup/
    func login(_ name: String) throws {
        guard let newUser = sampleUsers.filter({ $0.name.lowercased() == name.lowercased() }).first else {
            throw AuthenticationError.loginError("no user found for \(name)") }
            
        User.current = newUser
        print("current user is \(User.current?.name)")
    }
    
    func verifyNewUser(_ username: String, isVerified: @escaping (_ token: Bool) -> ()) throws {
        guard let humanDetect = self.humanDetect else { print("passive verification inactive"); return }
        switch humanDetect.getPassive() {
        case .success(let humanDetectToken):
            // Send humanDetectToken.token to your backend and
            // verify it with the Token Verification API
            // to determine human vs. bot
            verifyHumanDetectToken(humanDetectToken) { response in
                DispatchQueue.main.async {
                    print("returning response: \(response)")
                    isVerified(response.valid)
                }
            }
            
        case .failure(let error):
            throw error
        }
    }
    
    private func verifyHumanDetectToken(_ token: HumanDetectToken, completion: @escaping (TokenResponse) -> ()) {
        let url = URL(string: "https://api.unify.id/v1/humandetect/verify")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(Keys.serverAPIKey, forHTTPHeaderField: "X-API-Key")
        request.httpMethod = "POST"
        let jsonToken = try? JSONSerialization.data(withJSONObject: ["token": token.token], options: [])
        //else { print("failed to serialize human detect Token")}
        request.httpBody = jsonToken
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
                    completion(tokenResponse)
                } catch {
                    print( error)
                }
            }
        }
        
        task.resume()
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data,
//                let response = response as? HTTPURLResponse,
//                error == nil else {                                              // check for fundamental networking error
//                print("error", error ?? "Unknown error")
//                return
//            }
//
//            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
//                print("statusCode should be 2xx, but is \(response.statusCode)")
//                print("response = \(response)")
//                return
//            }
//
//            let responseString = String(data: data, encoding: .utf8)
//            print("responseString = \(responseString)")
//        }
//
//        task.resume()

    }
    
    func authenticateWalkAccess() {
        
    }
    
    enum AuthenticationError: Error {
        case loginError(String)
    }
}

struct TokenResponse: Codable {
    let valid: Bool
//    let identifier: String
//    let timestamp: String
//    let checksum: String
//    let version: String
}
