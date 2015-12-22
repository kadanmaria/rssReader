
import UIKit

class NewsTableViewController: UITableViewController {
   
   
    var news = [News]()
    let parser = Parser()
    

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
        cell.Indicator.startAnimating()
        cell.indexOfCell = indexPath.row
        
        let queue : dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)
        dispatch_async(queue, {() -> Void in
        if let urlOfNews = NSURL(string: newsObj.newsImageLink){
            let data = NSData(contentsOfURL: urlOfNews)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if (cell.indexOfCell == indexPath.row){
                    cell.photoImageView.contentMode = UIViewContentMode.ScaleAspectFit
                    cell.photoImageView.image = UIImage(data: data!)
                    cell.Indicator.stopAnimating()}
            })
            }
        })
        return cell
    }
    
    //MARK: System functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlString = NSURL(string: "http://news.tut.by/rss/index.rss"){
            parser.refreshNews(urlString)
        }
        news = parser.news
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

    
    // MARK: - Navigation

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowNewsSegue"{
            let destinationVC = segue.destinationViewController as! NewsScrollViewController
            if let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow{
                destinationVC.url = news[indexPath.row].newsLink
            }
        }
        
    }
    

}
