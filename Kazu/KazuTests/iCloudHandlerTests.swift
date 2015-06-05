//
//  iCloudHandlerTests.swift
//  Kazu
//
//  Created by Nick Jones on 03/04/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import XCTest
import CloudKit
import Kazu

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
}