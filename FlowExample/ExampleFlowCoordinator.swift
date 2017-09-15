//
//  ExampleFlowCoordinator.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import UIKit

protocol ExampleFlowCoordinatorOutput: class {
    var finishFlow: (() -> Void)? { get set }
    var didSelectUser: ((UserType) -> Void)? { get set }
}

class ExampleFlowCoordinator: ExampleFlowCoordinatorOutput {
    typealias Dependencies = HasUsersViewFactory & HasUserRetrieverFactory & HasUserFactory & HasUserProviderFactory
    let dependencies: Dependencies
    private let userProvider: UserProvider
    
    var finishFlow: (() -> Void)?
    var didSelectUser: ((UserType) -> Void)?
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        userProvider = dependencies.userProviderFactory.makeUserProvider()
    }
    
    func start(from controller: UIViewController) {
        let usersView = dependencies.usersViewFactory.makeUsersView().toPresent()
        (usersView as? UsersView)?.didSelectUser = { (user) in
            self.didSelectUser?(user)
        }
        let navigationController = UINavigationController(rootViewController: usersView)
        addCancelButton(to: usersView.navigationItem)
        controller.present(navigationController, animated: true, completion: nil)
        
        (usersView as? UsersView)?.showLoading() //<- can we avoid this optional with generics?
        
        loadUsers { (users) in
            self.userProvider.store(users: users)
            (usersView as? UsersView)?.show(provider: self.userProvider)
        }
    }
    
    private func loadUsers(completion: @escaping ([UserType]) -> Void) {
        let userRetriever = dependencies.userRetrieverFactory.makeUserRetriever(dependencies: dependencies)
        userRetriever.requestUsers { (users) in
            completion(users)
        }
    }
    
    private func addCancelButton(to navigationItem: UINavigationItem) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
    }
    
    @objc private func cancel() {
        finishFlow?()
    }
}
