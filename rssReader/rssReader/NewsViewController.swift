//
//  NewsViewController.swift
//  rssReader
//
//  Created by Admin on 22.10.15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    
    var url=""
    
    @IBOutlet weak var newsWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let webUrl = NSURL (string: url)
        let requestObj = NSURLRequest(URL: webUrl!)
        newsWebView.loadRequest(requestObj)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
