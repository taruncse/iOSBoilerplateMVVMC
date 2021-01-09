//
//  ToDoDetailsViewModelGuide.swift
//  Boilerplate
//
//  Created by DreamOnline on 5/1/21.
//

import Foundation

protocol ToDoDetailsViewModelViewDelegate : class {
    func dataUpdated(_ viewModel: ToDoDetailsViewModelGuide)
}
protocol ToDoDetailsViewModelCoordinatorDelegate : class {

}

protocol ToDoDetailsViewModelGuide : class {
    var data : ToDoDataModelGuide? { set get }
    var title : String? { get }
    var viewDelegate : ToDoDetailsViewModelViewDelegate? { set get }
    var coordinatorDelegate : ToDoDetailsViewModelCoordinatorDelegate? { set get }
}


