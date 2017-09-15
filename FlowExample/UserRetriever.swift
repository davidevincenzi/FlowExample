//
//  UserRetriever.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import Foundation

protocol UserRetriever {
    typealias Dependencies = HasUserFactory
    var dependencies: Dependencies { get set }
    
    func requestUsers(completion: @escaping ([UserType]) -> Void)
}
