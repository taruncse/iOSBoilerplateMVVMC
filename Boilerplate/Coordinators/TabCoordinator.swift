//
//  TabCoordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation
import UIKit

protocol TabCoordinatorDelegate {
    func didTabbarFinished()
}

class TabCoordinator: NSObject, Coordinator {
    var childCoordinators = [String : Coordinator] ()
        
    var navigationController: UINavigationController
    
    var window: UIWindow
    
    var delegate : TabCoordinatorDelegate?
    
    let tabBar = UITabBarController()
    
    let userEmail : String
    
    init(_ window : UIWindow, _ navigationController: UINavigationController, email : String) {
        self.window = window
        self.navigationController = navigationController
        self.userEmail = email
    }
    
    func start() {
        initTabBar()
    }
    
    deinit {
        print("TabCoordinator dinit")
    }
    
}

extension TabCoordinator {
    func initTabBar() {
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        vc1.title = "First"
        
        let todoViewController = ToDoViewController.instantiate()
        let todoViewModel = ToDoViewModel(email: userEmail)
        todoViewModel.todoModel = ToDoModel()
        todoViewModel.coordinatorDelegate = self
        todoViewController.viewModel = todoViewModel
        
        self.navigationController = UINavigationController(rootViewController:todoViewController)
        self.navigationController.title = "Second"
        self.navigationController.delegate = self
        let vc3 = UINavigationController(rootViewController:ThirdViewController())
        vc3.title = "Third"
        let vc4 = UINavigationController(rootViewController:FourthViewController())
        vc4.title = "Fourth"
        let vc5 = UINavigationController(rootViewController:FifthViewController())
        vc5.title = "Fifth"
        
        self.tabBar.setViewControllers([vc1,self.navigationController,vc3,vc4,vc5], animated: true)
        self.tabBar.selectedIndex = 0
        guard let items = self.tabBar.tabBar.items else {
            return
        }
        
        let images = ["house", "bell", "person.circle" , "star", "gear"]
        
        for (index,item) in items.enumerated(){
            item.image = UIImage(systemName: images[index])
        }
        self.tabBar.delegate = self
        self.tabBar.modalPresentationStyle = .fullScreen
        //navigationController.viewControllers = [tabBar]
        window.rootViewController = self.tabBar
        //navigationController.pushViewController(tabBar, animated: true)
    }
    
}

extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
        print("didSelect")
    }
}

extension TabCoordinator : ToDoViewModelCoordinatorDelegate {
    func listViewModelDidSelectedData(viewModel: ToDoViewModelGuide, data: ToDoDataModelGuide) {
        print("item selected")
        let todoDetailsCoordinator = ToDoDetailsCoordinator(window: window, navigationController: navigationController, data: data)
        todoDetailsCoordinator.delegate = self
        childCoordinators[Common.KEY_TODO_DETAILS_COORDINATOR] = todoDetailsCoordinator
        todoDetailsCoordinator.start()
    }
}

extension TabCoordinator :  ToDoDetailsCoordinatorDelegate {
    func didDetailsViewFinished() {
        print("Child Coordinator finished")
    }
}

extension TabCoordinator : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        if let todoDetailsViewController = fromViewController as? ToDoDetailsViewController {
            // We're popping a buy view controller; end its coordinator
            
        }
        childCoordinators.removeValue(forKey: Common.KEY_TODO_DETAILS_COORDINATOR)
        print("count : \(childCoordinators.count)")
    }
}
