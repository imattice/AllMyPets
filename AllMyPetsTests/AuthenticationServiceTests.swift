//
//  AuthServiceTests.swift
//  AllMyPetsTests
//
//  Created by Ike Mattice on 10/6/20.
//

import XCTest
@testable import AllMyPets

class AuthServiceTests: XCTestCase {
    var authService: AuthenticationService? = AuthenticationService.shared

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        XCTAssertNil(User.current)
        
        try? AuthenticationService.shared.login("blueberryRush")
        XCTAssertNotNil(User.current)
        XCTAssertTrue(User.current?.name == "blueberryRush")
        
        try? AuthenticationService.shared.login("cityOfPigeons")
        XCTAssertTrue(User.current?.name == "cityOfPigeons")

        XCTAssertThrowsError(try AuthenticationService.shared.login("lampPlant"))
    }
}
