//
//  iCloudHandlerTests.swift
//  CountingDaisy
//
//  Created by Nick Jones on 03/04/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import XCTest
import CloudKit
import CountingDaisy

class iCloudHandlerTests:XCTestCase  {
    
    var cloudKitHandler: CloudKitHandler? = nil
    var container: CKContainer? = nil
    var publicDatabase: CKDatabase? = nil
    
    override func setUp() {
        super.setUp()
        cloudKitHandler = CloudKitHandler()
        container = CKContainer.defaultContainer()
        publicDatabase = container!.publicCloudDatabase
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_does_user_have_iCloud_account_returns_the_iCloud_status_of_the_current_user () {
        
        var doesUserHaveiCloudAccount = cloudKitHandler!.doesUserHaveiCloudAccount()
        println("\(doesUserHaveiCloudAccount)")
        XCTAssertTrue(doesUserHaveiCloudAccount, "Found false when checking whether user has an iCloud account, check that an account is logged in on the simulator, if so then true should be returned.")
    }
    
//    func test_get_current_user_ID_returns_the_correct_user_ID () {
//        let myUserID = "_a57181cf1088a3e86db00719d57c3bc6"
//        let expectation = expectationWithDescription("...")
//        let cloudKitMaker = CloudKitHandler()
//        cloudKitMaker.getUserID()
//        
//        XCTAssertEqual(myUserID, currentUserID!, "Expected value equal to myUserID value but got \(currentUserID)")
//    }
//    
}