//
//  MyFirstClassTableViewController.swift
//  rssReader
//
//  Created by iStudent on 10/8/15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class MyFirstClassTableViewController: UITableViewController, NSXMLParserDelegate {
    
    
    
    var myFirstClassObjects = [MyFirstClass]()
    
    var xmlParser: NSXMLParser!
    
    func refreshNews(){
       // let urlString = NSURL(string: "https://developer.apple.com/news/rss/news.rss")
        let urlString = NSURL(string: "http://www.blubrry.com/feeds/onorte.xml")
        xmlParser = NSXMLParser(contentsOfURL: urlString!)
        xmlParser.delegate = self
        xmlParser.parse()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshNews()
        loadSampleMyFirstClassObjects()
        
    }
    
    class News: NSObject{
        var newsTitle = ""
        var newsDescription = ""
    }
    
    var news = [News]()
    
    var entryTitle: String!
    var entryDescription: String!
    
    var currentParsedElement = String()
    var weAreInsideAnItem = false
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName: String?, attribute attributeDict: [NSObject: AnyObject]){
        if elementName == "item"{
            weAreInsideAnItem = true
        }
        if weAreInsideAnItem{
            switch elementName{
            case "title":
                entryTitle = String()
                currentParsedElement = "title"
            case "itunes:summary":
                entryDescription = String()
                currentParsedElement = "itunes:summary"
            default: break
            }
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if weAreInsideAnItem{
            switch currentParsedElement{
            case "title":
                entryTitle = entryTitle + string
            case "itunes:summary":
                entryDescription = entryDescription + string
            default: break
                
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if weAreInsideAnItem{
            switch elementName{
            case "title":
                currentParsedElement = ""
            case "itunes:summary":
                currentParsedElement = ""
            default: break
            }
            if elementName == "item"{
                let entryNews = News()
                entryNews.newsTitle = entryTitle
                entryNews.newsDescription = entryDescription
                news.append(entryNews)
                weAreInsideAnItem = false
            }
        }
    }
    
    
    
    
    
    func loadSampleMyFirstClassObjects()
    {
        let img1 = UIImage(named: "cat")!
        let myFirstClassObject1 = MyFirstClass(headName: "Masha Kadan", someText: "Miau verride to support conditional editing of the table view override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath:Return fals Miau verride to support conditional editing of the table view override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath:Return fals", image: img1)
        
        let img2 = UIImage(named: "photo1")!
        let myFirstClassObject2 = MyFirstClass(headName: "Artiom Mazurkevich", someText: "loh :3", image: img2)
        
        myFirstClassObjects += [myFirstClassObject1, myFirstClassObject2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myFirstClassObjects.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cellId = "MyFirstClassTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! MyFirstClassTableViewCell
        
        let myFirstClassObject = myFirstClassObjects[indexPath.row]
        cell.headNameLabel.text = myFirstClassObject.headName
        cell.someNumberLabel.text = myFirstClassObject.someText
        cell.imageImageView.image = myFirstClassObject.image
        
        return cell
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
