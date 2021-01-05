//
//  ToDoDataModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 4/1/21.
//

import Foundation

class ToDoDataModel: ToDoDataModelGuide {
    var title: String
    var description: String
    
    init(title : String, description : String) {
        self.title = title
        self.description = description
    }
}
