//
//  Task.swift
//  TodoList
//
//  Created by Nhi Quach on 2/24/16.
//  Copyright © 2016 Nhi Quach. All rights reserved.
//

import UIKit

class Task: NSObject {

    // A text description of this item.
    var text: String
    
    // A Boolean value that determines the completed state of this item.
    var completed: Bool
    
    // Returns a ToDoItem initialized with the given text and default completed value.
    init(text: String) {
        self.text = text
        self.completed = false
    }
    
    
}
