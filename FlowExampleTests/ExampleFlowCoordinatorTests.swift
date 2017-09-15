//
//  ExampleFlowCoordinatorTests.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import XCTest
@testable import FlowExample

/*
 
 We can test our flow coordinator too just by injecting dependencies. In this example we inserted a boolean check in our mock UsersView, so that we are sure that the showLoading method is called. This would not have been possible if the Flow Coordinator had a direct dependency to the view controller.
 
 */

class ExampleFlowCoordinatorTests: XCTestCase {
    
    func testShowLoadingIsCalled() {
        let controller = UIViewController()
        let dependencies = TestsDependencies()
        let coordinator = ExampleFlowCoordinator(dependencies: dependencies)
        coordinator.start(from: controller)
        XCTAssertTrue(dependencies.factory.usersView!.showLoadingCalled)
    }
}
