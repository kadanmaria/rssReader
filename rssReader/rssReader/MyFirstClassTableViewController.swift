//
//  MyFirstClassTableViewController.swift
//  rssReader
//
//  Created by iStudent on 10/8/15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import UIKit

class MyFirstClassTableViewController: UITableViewController {

    
    var myFirstClassObjects = [MyFirstClass]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMyFirstClassObjects()
        
    }
    
    func loadSampleMyFirstClassObjects()
    {
        let myFirstClassObject1 = MyFirstClass(headName: "Masha Kadan", someText: "Very pleasant girl with short hair gjhyfj djfd hjdf  hkejrhfk khfj hkjhkh kjehfkjs hkjh fkjsh jkhekj hrfkjehfkjs hewkjhfk hsdkjfh k")
        let myFirstClassObject2 = MyFirstClass(headName: "Artiom Mazurkevich", someText: "loh")
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
