//
//  NewsViewController.swift
//  rssReader
//
//  Created by Admin on 22.10.15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    
    
    @IBOutlet weak var newsWebView: UIWebView!

//    var currentNewsObj=News()
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let webUrl = NSURL (string: url)
        let requestObj = NSURLRequest(URL: webUrl!)
        newsWebView.loadRequest(requestObj)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
