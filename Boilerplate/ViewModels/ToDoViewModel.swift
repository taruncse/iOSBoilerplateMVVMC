//
//  ToDoViewModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 5/1/21.
//

import Foundation

class ToDoViewModel: ToDoViewModelGuide {
    
    var viewDelegate: ToDoViewModelViewDelegate?
    
    var coordinatorDelegate: ToDoViewModelCoordinatorDelegate?
    
    var email : String
    
    init(email : String) {
        self.email = email
    }
    
    var todoModel: ToDoModelGuide?{
        didSet {
            todoDataModel = nil
            todoModel?.getAllToDoList(userEmail: self.email, success: {[weak self] (todoList, error) in
                if let todoList = todoList {
                    self?.todoDataModel = todoList
                }
            })
            
        }
    }
    
    fileprivate var todoDataModel : [ToDoDataModelGuide]? {
        didSet {
            viewDelegate?.itemsDidChange(viewModel:self)
        }
    }
    
    var title: String {
        return "ToDo"
    }
    
    var numberOfItems: Int {
        if let todo = todoDataModel {
            return todo.count
        }else {
            return 0
        }
    }
    
    func todoAtIndex(_ index: Int) -> ToDoDataModelGuide? {
        if let todo = todoDataModel, todo.count > index {
            return todo[index]
        }
        return nil
    }
    
    func todoItemAtIndex(index: Int) {
        
        if let todo = todoDataModel, todo.count > index, let coordinatorDelegate = coordinatorDelegate {
            coordinatorDelegate.listViewModelDidSelectedData(viewModel: self, data: todo[index])
        }
    }
}
