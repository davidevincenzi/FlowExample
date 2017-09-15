//
//  AppDependencies.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

final class AppDependencies: HasUserFactory, HasUserProviderFactory, HasUserRetrieverFactory, HasUsersViewFactory {
    var userFactory: UserFactory { return factory }
    var userProviderFactory: UserProviderFactory { return factory }
    var userRetrieverFactory: UserRetrieverFactory { return factory }
    var usersViewFactory: UsersViewFactory { return factory }
    
    let factory = ExampleFlowFactory()
}

let appDependencies = AppDependencies()
