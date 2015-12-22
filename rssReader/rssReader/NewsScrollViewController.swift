//
//  NewsScrollViewController.swift
//  rssReader
//
//  Created by Admin on 08.12.15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class NewsScrollViewController: UIViewController{

    var url=""
    
//    @IBOutlet weak var UrlLabel: UILabel!
        
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var newsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlLabel.text = url
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
