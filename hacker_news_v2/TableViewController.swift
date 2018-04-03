//
//  TableViewController.swift
//  hacker_news_v2
//
//  Created by Mariano Martinez on 2/4/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import UIKit
import Rswift

class TableViewController: UITableViewController, pushButtonProtocol {
    func iPushedAButton() {
        let alert = UIAlertController.init(title:"Protocol/delegate/stuff happened", message:"", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    var hackerNewsArray: [HackerNews] = []
    var selectedNews : HackerNews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(R.nib.tableViewCell); APIManager.shared_APIManager.getHackerNews(completionSuccess: { (arrayHackerNews) in
            self.hackerNewsArray = arrayHackerNews
            self.tableView.reloadData()
        }) { (errorMessage) in
            let alert = UIAlertController.init(title:"Error", message:errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.hackerNewsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hackerCell", for: indexPath) as! TableViewCell
        let hackerNews = hackerNewsArray[indexPath.row]
        cell.setHackerNewsData(hackerNews: hackerNews)
        cell.delegate = self

        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedNews = hackerNewsArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailView", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView"{
            let dest = segue.destination as! ViewController
            dest.hackerNews = self.selectedNews
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
