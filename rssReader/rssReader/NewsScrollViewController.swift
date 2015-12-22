//
//  NewsScrollViewController.swift
//  rssReader
//
//  Created by Admin on 08.12.15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class NewsCollectionViewController: UICollectionViewController {

    var url=""
    


//    @IBOutlet weak var UrlLabel: UILabel!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
  //      UrlLabel.text = url
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - Navigation


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WebViewSegue"{
            let destinationVC = segue.destinationViewController as! NewsViewController
                destinationVC.url = url
            
        }
        
    }
}
