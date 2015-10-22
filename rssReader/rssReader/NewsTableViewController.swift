//
//  MyFirstClassTableViewController.swift
//  rssReader
//
//  Created by iStudent on 10/8/15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController, NSXMLParserDelegate {
   
    
   //MARK: Parser
    
    var xmlParser: NSXMLParser!
    var news = [News]()
    
    var entryTitle: String!
    var entryDescription: String!
    var entryPubDate: String!
    var entryLink: String!
    
    var currentParsedElement = String()
    var weAreInsideAnItem = false
    
    func refreshNews(){
        let urlString = NSURL(string: "https://developer.apple.com/news/rss/news.rss")
        let xmlParser = NSXMLParser(contentsOfURL: urlString!)
        xmlParser!.delegate = self
        xmlParser!.parse()
    }
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "item"{
            weAreInsideAnItem = true
        }
        if weAreInsideAnItem{
            switch elementName{
            case "title":
                entryTitle = String()
                currentParsedElement = "title"
            case "description":
                entryDescription = String()
                currentParsedElement = "description"
            case "pubDate":
                entryPubDate = String()
                currentParsedElement = "pubDate"
            case "link":
                entryLink = String()
                currentParsedElement = "link"
            default: break
            }
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if weAreInsideAnItem{
            switch currentParsedElement{
            case "title":
                entryTitle = entryTitle + string
            case "description":
                entryDescription = entryDescription + string
            case "pubDate":
                entryPubDate = entryPubDate + string
            case "link":
                entryLink = entryLink + string
            default: break
                
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if weAreInsideAnItem{
            switch elementName{
            case "title":
                currentParsedElement = ""
            case "description":
                currentParsedElement = ""
            case "pubDate":
                currentParsedElement = ""
            case "link":
                currentParsedElement = ""
            default: break
            }
            if elementName == "item"{
                let entryNews = News()
                entryNews.newsTitle = entryTitle
                entryNews.newsDescription = entryDescription
                entryNews.newsPubDate = entryPubDate
                entryNews.newsLink = entryLink
                news.append(entryNews)
                weAreInsideAnItem = false
            }
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cellId = "NewsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! NewsTableViewCell
        
        let newsObj = news[indexPath.row]
        cell.headNameLabel.text = newsObj.newsTitle
        cell.descriptionLabel.text = newsObj.newsDescription
        cell.dateLabel.text = newsObj.newsPubDate
    
        return cell
    }
    
    //MARK: System functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshNews()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
