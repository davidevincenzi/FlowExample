//
//  OnlineUserRetriever.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import Foundation

class OnlineUserRetriever: UserRetriever {
    var dependencies: UserRetriever.Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func requestUsers(completion: @escaping ([UserType]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            var users = [UserType]()
            for x in 0...30 {
                users.append(self.dependencies.userFactory.makeUser(name: "Test \(x)"))
            }
            
            completion(users)
        }
    }
}
