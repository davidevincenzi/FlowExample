//
//  UsersTableViewController.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import UIKit

class UsersTableViewController: UITableViewController, UsersView {
    private var usersProvider: UserProvider?
    var didSelectUser: ((UserType) -> Void)?
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    func showLoading() {
        activityIndicatorView.center = CGPoint(x: view.frame.midX, y: 40)
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
    }
    func show(provider: UserProvider) {
        activityIndicatorView.removeFromSuperview()
        
        self.usersProvider = provider
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let provider = usersProvider else { return 0 }
        
        return provider.numberOfUsers()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let user = usersProvider?.itemAt(index: indexPath.row) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        cell.configure(with: user)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = usersProvider?.itemAt(index: indexPath.row) else { return }
        didSelectUser?(user)
    }
}
