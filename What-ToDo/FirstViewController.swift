//
//  FirstViewController.swift
//  What-ToDo
//
//  Created by Soumyajit Sarkar on 1/31/16.
//  Copyright © 2016 Raul. All rights reserved.
//

import UIKit

// Create a Global toDoList variable
var toDoList = [String]()

class FirstViewController: UIViewController ,UITableViewDelegate{
    

    @IBOutlet var toDoListTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Check to see if toDoList exists or not
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{

    let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    cell.textLabel?.text = toDoList[indexPath.row]
    return cell
    }
    // To update the table values, we can use the viewDidAppear method
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }
    // Code to swipe left and delete from toDoList
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            toDoListTable.reloadData()
        }
        
    }


}

