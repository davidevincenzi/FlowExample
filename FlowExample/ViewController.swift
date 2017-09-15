//
//  ViewController.swift
//  FlowExample
//
//  Created by Davide Vincenzi on 15.09.17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectionLabel: UILabel!
    
    @IBAction func startFlow(_ sender: Any) {
        let flowCoordinator = ExampleFlowCoordinator(dependencies: appDependencies)
        flowCoordinator.didSelectUser = { (user) in
            self.selectionLabel.text = user.name
            self.dismiss(animated: true, completion: nil)
        }
        flowCoordinator.finishFlow = {
            self.dismiss(animated: true, completion: nil)
        }
        flowCoordinator.start(from: self)
    }
}
