//
//  ToDoModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 4/1/21.
//

import Foundation

class ToDoModel: ToDoModelGuide {
    
    fileprivate var todoList = [ToDoDataModelGuide]()
    
    init() {
        generateStaticItem()
    }
    func generateStaticItem() {
        todoList.append(ToDoDataModel(title: "Email someone", description: "Bla bla bla"))
        todoList.append(ToDoDataModel(title: "Email someone", description: "Bla bla bla"))
        todoList.append(ToDoDataModel(title: "Email someone", description: "Bla bla bla"))
    }
    
    func getAllToDoList(userEmail: String, success completion: @escaping ([ToDoDataModelGuide]?, Error?) -> Void) {
        DispatchQueue.global().async {
            completion(self.todoList,nil)
        }
    }
}
