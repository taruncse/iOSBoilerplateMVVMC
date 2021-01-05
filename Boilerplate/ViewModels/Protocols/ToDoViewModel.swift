//
//  ToDoViewModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 5/1/21.
//

import Foundation

protocol ListViewModelViewDelegate: class {
    func itemsDidChange(viewModel: ToDoViewModelGuide)
}

protocol listViewModelCoordinatorDelegate {
    func listViewModelDidSelectedData( viewModel: ToDoViewModelGuide, data: ToDoDataGuide)
}

protocol ToDoViewModelGuide {
    var itemModel : ListModel? { get set}
    var viewDelegate : ListViewModelViewDelegate? { get set}
    var coordinatorDelegate : listViewModelCoordinatorDelegate? { get set}

    var title: String { get }
    var numberOfItems: Int { get }
    func itemAtIndex (_ index: Int) -> ItemProtocol?
    func useItemAtIndex (index : Int)
    
    
}
