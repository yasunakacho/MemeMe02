//
//  MemeViewController.swift
//  MemeMe01
//
//  Created by Yasunaka Cho on 2/2/16.
//  Copyright © 2016 Yasunaka Cho. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = self.editButtonItem()
        }
    
    func startOver(){
        if let navigationController = self.navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
}
