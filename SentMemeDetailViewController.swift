//
//  SentMemeDetailViewController.swift
//  MemeMe01
//
//  Created by Yasunaka Cho on 2/4/16.
//  Copyright © 2016 Yasunaka Cho. All rights reserved.
//

import UIKit

class SentMemeDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = self.editButtonItem()
        }
        
    func startOver(){
        if let navigationController = navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let memedImage = meme.memedImage {
            imageView!.image = memedImage
        }
        tabBarController?.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.hidden = false
    }

}
