//
//  MyFirstClassViewController.swift
//  rssReader
//
//  Created by Admin on 21.10.15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class MyFirstClassViewController: UIViewController, NSXMLParserDelegate {

    
    var url = NSURL(string: "https://developer.apple.com/news/rss/news.rss")
    var xmlParser = NSXMLParser(contentsOfURL: url)
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
