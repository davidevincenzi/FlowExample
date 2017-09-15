//
//  Mocks.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import UIKit
@testable import FlowExample

struct UserDummy: UserType {
    var name: String
}

class UsersProviderMock: UserProvider {
    let usersNumber: Int
    
    init(usersNumber: Int) {
        self.usersNumber = usersNumber
    }
    
    func itemAt(index: Int) -> UserType? {
        return UserDummy(name: "UnitTest")
    }
    
    func numberOfUsers() -> Int {
        return 100
    }
    
    func store(users: [UserType]) {}
}

class FactoryMock: UserFactory, UserProviderFactory, UserRetrieverFactory, UsersViewFactory {
    func makeUser(name: String) -> UserType {
        return UserDummy(name: name)
    }
    func makeUserProvider() -> UserProvider {
        return UsersProviderMock(usersNumber: 1)
    }
    func makeUserRetriever(dependencies: UserRetriever.Dependencies) -> UserRetriever {
        return UserRetrieverMock(dependencies: dependencies)
    }
    func makeUsersView() -> UsersView {
        self.usersView = UsersViewMock()
        return usersView!
    }
    var usersView: UsersViewMock?
}

class UserRetrieverMock: UserRetriever {
    var dependencies: UserRetriever.Dependencies
    func requestUsers(completion: @escaping ([UserType]) -> Void) {
        completion([dependencies.userFactory.makeUser(name: "Test")])
    }
    
    init(dependencies: UserRetriever.Dependencies) {
        self.dependencies = dependencies
    }
}

class UsersViewMock: UIViewController, UsersView {
    var showLoadingCalled = false
    
    var didSelectUser: ((UserType) -> Void)?
    
    func showLoading() {
        showLoadingCalled = true
    }
    func show(provider: UserProvider) {
        
    }
}

struct TestsDependencies: ExampleFlowCoordinator.Dependencies {
    var userFactory: UserFactory { return factory }
    var userProviderFactory: UserProviderFactory { return factory }
    var userRetrieverFactory: UserRetrieverFactory { return factory }
    var usersViewFactory: UsersViewFactory { return factory }
    
    let factory = FactoryMock()
}
