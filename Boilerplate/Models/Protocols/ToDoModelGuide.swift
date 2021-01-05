//
//  ToDoModelGuide.swift
//  Boilerplate
//
//  Created by DreamOnline on 4/1/21.
//

import Foundation

protocol ToDoModelGuide {
    func getAllToDoList (userEmail : String , success : @escaping(_ todoList : [ToDoDataModelGuide]? , _ error : Error?)-> Void  )
}
