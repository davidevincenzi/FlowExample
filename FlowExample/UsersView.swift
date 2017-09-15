//
//  UsersView.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import Foundation

protocol UsersView: BaseView {
    
    var didSelectUser: ((UserType) -> Void)? { get set }
    
    func showLoading()
    func show(provider: UserProvider)
}
