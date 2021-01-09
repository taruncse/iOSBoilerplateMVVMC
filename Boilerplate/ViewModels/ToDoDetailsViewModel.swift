//
//  ToDoDetailsViewModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 5/1/21.
//

import Foundation

class ToDoDetailsViewModel: ToDoDetailsViewModelGuide {
    var title: String? {
        return "ToDo Details"
    }
    
    
    var data: ToDoDataModelGuide?{
        didSet {
            viewDelegate?.dataUpdated(self)
        }
    }
    
   weak var viewDelegate: ToDoDetailsViewModelViewDelegate?
    
   weak var coordinatorDelegate: ToDoDetailsViewModelCoordinatorDelegate?
    
    deinit {
        print("ToDoDetailsViewModel finished")
    }
}
