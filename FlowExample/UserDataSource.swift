//
//  UserDataSource.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import Foundation

class UserDataSource: UserProvider {
    private var users = [UserType]()
    
    func store(users: [UserType]) {
        self.users = users
    }
    
    func itemAt(index: Int) -> UserType? {
        guard users.count >= index else { return nil }
        
        return users[index]
    }
    
    func numberOfUsers() -> Int {
        return users.count
    }
}
