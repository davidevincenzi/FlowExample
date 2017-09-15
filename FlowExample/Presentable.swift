//
//  Presentable.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController {
        return self
    }
}
