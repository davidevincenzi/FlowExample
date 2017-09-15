//
//  UsersTableViewControllerTests.swift
//  FlowExampleTests
//
//  Created by Davide Vincenzi on 15.09.17.
//

import XCTest
@testable import FlowExample

/*
 
 We can test our view controller without any dependency and by using mock or dummy objects.
 
 */

class UsersTableViewControllerTests: XCTestCase {
    
    func testExample() {
        let controller = UsersTableViewController()
        controller.show(provider: UsersProviderMock(usersNumber: 100))
        
        XCTAssert(controller.tableView.numberOfRows(inSection: 0) == 100)
    }
}
