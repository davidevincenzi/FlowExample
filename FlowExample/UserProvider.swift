//
//  UserProvider.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import Foundation

protocol UserProvider {
    func store(users: [UserType])
    func numberOfUsers() -> Int
    func itemAt(index: Int) -> UserType?
}
