//
//  ExampleFlowFactory.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import Foundation

protocol HasUserFactory {
    var userFactory: UserFactory { get }
}

protocol UserFactory {
    func makeUser(name: String) -> UserType
}


protocol HasUsersViewFactory {
    var usersViewFactory: UsersViewFactory { get }
}

protocol UsersViewFactory {
    func makeUsersView() -> UsersView
}


protocol HasUserProviderFactory {
    var userProviderFactory: UserProviderFactory { get }
}

protocol UserProviderFactory {
    func makeUserProvider() -> UserProvider
}


protocol HasUserRetrieverFactory {
    var userRetrieverFactory: UserRetrieverFactory { get }
}

protocol UserRetrieverFactory {
    func makeUserRetriever(dependencies: UserRetriever.Dependencies) -> UserRetriever
}



class ExampleFlowFactory: UserFactory, UsersViewFactory, UserProviderFactory, UserRetrieverFactory {

    func makeUser(name: String) -> UserType {
        return User(name: name)
    }
    
    func makeUsersView() -> UsersView {
        return UsersTableViewController()
    }
    
    func makeUserProvider() -> UserProvider {
        return UserDataSource()
    }
    
    func makeUserRetriever(dependencies: UserRetriever.Dependencies) -> UserRetriever {
        return OnlineUserRetriever(dependencies: dependencies)
    }
}
