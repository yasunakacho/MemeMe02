//
//  MemeCollectionViewController.swift
//  MemeMe01
//
//  Created by Yasunaka Cho on 2/2/16.
//  Copyright © 2016 Yasunaka Cho. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
        
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]{
        
        get {
            return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        }
        set {
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.hidden = false
        collectionView!.reloadData()
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
//      understand the differences below.
//        cell.setText(meme.top, bottomString: meme.bottom)
//        let imageView = UIImageView(image: meme.image)
//        cell.backgroundView = imageView
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.item]
        cell.sentMeme!.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("SentMemeDetailViewController") as! SentMemeDetailViewController
        detailController.meme = self.memes [indexPath.item]
        navigationController!.pushViewController(detailController, animated: true)
        
    }

}