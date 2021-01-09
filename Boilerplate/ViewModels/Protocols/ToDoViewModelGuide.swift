//
//  ToDoViewModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 5/1/21.
//

import Foundation

protocol ToDoViewModelViewDelegate: class {
    func itemsDidChange(viewModel: ToDoViewModelGuide)
}

protocol ToDoViewModelCoordinatorDelegate : class {
    func listViewModelDidSelectedData( viewModel: ToDoViewModelGuide, data: ToDoDataModelGuide)
}

protocol ToDoViewModelGuide : class {
    var todoModel : ToDoModelGuide? { get set}
    var viewDelegate : ToDoViewModelViewDelegate? { get set}
    var coordinatorDelegate : ToDoViewModelCoordinatorDelegate? { get set}

    var title: String { get }
    var numberOfItems: Int { get }
    func todoAtIndex (_ index: Int) -> ToDoDataModelGuide?
    func todoItemAtIndex (index : Int)
    
}
