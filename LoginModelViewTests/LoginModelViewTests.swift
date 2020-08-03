//
//  LoginModelViewTests.swift
//  LoginModelViewTests
//
//  Created by Habib Durodola on 2020-08-03.
//  Copyright © 2020 DOH. All rights reserved.
//

import XCTest
@testable import LoginModelView

class LoginModelViewTests: XCTestCase {


    func testInvalidInput() throws {

        let expectation = self.expectation(description: "empty")
        let userVM = UserVM("", password: "")
        userVM.validateInput(userName: userVM.userName, password: userVM.password)
        userVM.loginCompletionHandler { (status, message) in
            XCTAssertFalse(status)
            expectation.fulfill()
        }
        self.callWait()
    }

    func testValidInput() throws {

        let expectation = self.expectation(description: "valid")
        let userVM = UserVM("username", password: "password")
        userVM.validateInput(userName: userVM.userName, password: userVM.password)
        userVM.loginCompletionHandler { (status, message) in
            XCTAssertTrue(status)
            expectation.fulfill()
        }
        self.callWait()
    }

    func callWait()  {
        self.waitForExpectations(timeout: 10) { (error) in
            guard error == nil else {
                XCTAssert(false)
                NSLog("Timeout Error.")
                return
            }
        }

    }



}
