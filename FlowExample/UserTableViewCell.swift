//
//  UserTableViewCell.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
}

extension UserTableViewCell {
    func configure(with user: UserType) {
        nameLabel.text = user.name
    }
}
