//
//  MemeTableViewController.swift
//  MemeMe01
//
//  Created by Yasunaka Cho on 2/2/16.
//  Copyright © 2016 Yasunaka Cho. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes : [Meme]{
        
        get {
            return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        }
        set {
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let step 5.8?/
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.hidden = false
        tableView.reloadData()
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count 
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCollectionViewCell")!
        let meme = memes[indexPath.row]
//        cell.textLabel?.text = meme.topText! + " " + meme.bottomText!
//        cell.imageView!.image = meme.memedImage

        cell.textLabel?.text = meme.topText! + " " + meme.bottomText!
        cell.imageView!.image = meme.memedImage
        
        return cell
        }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("SentMemeDetailViewController") as! SentMemeDetailViewController
        detailController.meme = memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }

}