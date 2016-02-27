//
//  StatsViewController.swift
//  TodoList
//
//  Created by Nhi Quach on 2/24/16.
//  Copyright © 2016 Nhi Quach. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var numberOfTasksCompleted : Int?
    var tasks : [Task]?
    
    @IBOutlet weak var completedLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        let currentDate = NSDate()
        var completedCount = 0
        for task in self.tasks! {
            let dayCompleted: NSDate? = task.timeCompleted
            if dayCompleted != nil {
                if currentDate.timeIntervalSinceDate(dayCompleted!) < 86400 {
                    completedCount += 1
                }
            }
        numberOfTasksCompleted = completedCount
        self.completedLabel.text = String(numberOfTasksCompleted!)
        }
    }
    
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
