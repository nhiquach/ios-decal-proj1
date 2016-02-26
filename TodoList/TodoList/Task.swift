//
//  Task.swift
//  TodoList
//
//  Created by Nhi Quach on 2/24/16.
//  Copyright © 2016 Nhi Quach. All rights reserved.
//

import UIKit

class Task: NSObject {

    var text: String
    var completed: Bool
    var timeCompleted: Int?
    
    
    // Returns a ToDoItem initialized with the given text and default completed value.
    init(text: String) {
        self.text = text
        self.completed = false
    }
    
    
}
