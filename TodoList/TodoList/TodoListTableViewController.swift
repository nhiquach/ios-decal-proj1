//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by Nhi Quach on 2/23/16.
//  Copyright © 2016 Nhi Quach. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    @IBOutlet var taskTable: TaskTableView!
    var tasks = [Task]()
    
    override func viewWillAppear(animated: Bool) {
        var newTasks = [Task]()
        let currentDate = NSDate()
        for task in tasks {
            let dayCompleted: NSDate? = task.timeCompleted
            if dayCompleted != nil {
                if currentDate.timeIntervalSinceDate(dayCompleted!) < 86400 {
                    newTasks.append(task)
                }
            } else {
                newTasks.append(task)
            }
        }
        tasks = newTasks
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindFromSave" {
            let source: AddTaskViewController = segue.sourceViewController as! AddTaskViewController
            let task: Task? = source.task
            
            if task != nil {
                self.tasks.append(task!)
                self.tableView.reloadData()
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
        return tasks.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TaskTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]
        cell.taskLabel.text = task.text
        if task.completed {
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: task.text)
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.taskLabel.attributedText = attributeString
        } else {
            cell.accessoryType = .None
        }
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem: Task = tasks[indexPath.row] as Task
        tappedItem.completed = !tappedItem.completed
        if tappedItem.completed {
            tappedItem.timeCompleted = NSDate()
        } else {
            tappedItem.timeCompleted = nil
        }
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            tasks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToStats" {
            let destVC = segue.destinationViewController as! StatsViewController
            destVC.tasks = self.tasks
        }
    }


}
