//
//  ToDoDetailsCoordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 9/1/21.
//

import Foundation
import UIKit

protocol ToDoDetailsCoordinatorDelegate {
    func didDetailsViewFinished()
}

class ToDoDetailsCoordinator: Coordinator {
    var childCoordinators = [String : Coordinator]()
    
    var navigationController: UINavigationController
    
    var window: UIWindow
    
    var data: ToDoDataModelGuide
    
    var delegate : ToDoDetailsCoordinatorDelegate?
    
    init(window: UIWindow, navigationController: UINavigationController, data: ToDoDataModelGuide) {
        self.window = window
        self.navigationController = navigationController
        self.data = data
    }
    
    func start() {
        let todoDetailsVC = ToDoDetailsViewController.instantiate()
        let todoDetailsViewModel = ToDoDetailsViewModel()
        todoDetailsViewModel.data = data
        todoDetailsViewModel.coordinatorDelegate = self
        todoDetailsVC.viewModel = todoDetailsViewModel
        //window.rootViewController = todoDetailsVC
        self.navigationController.pushViewController(todoDetailsVC, animated: true)
        //self.navigationController.present(todoDetailsVC, animated: true, completion: nil)
    }
    
    deinit {
        print("ToDoDetailsCoordinator finished")
    }
}

extension ToDoDetailsCoordinator : ToDoDetailsViewModelCoordinatorDelegate {
    
}

