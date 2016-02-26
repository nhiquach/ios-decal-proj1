//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by Nhi Quach on 2/23/16.
//  Copyright © 2016 Nhi Quach. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var task : Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if sender as? NSObject != self.saveButton {
            return
        }
        if self.taskField.text != "" {
            self.task = Task(text: self.taskField.text!)
        }
    }


}
