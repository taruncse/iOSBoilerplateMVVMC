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
        
        let vc2 = UINavigationController(rootViewController:todoViewController)
        vc2.title = "Second"
        let vc3 = UINavigationController(rootViewController:ThirdViewController())
        vc3.title = "Third"
        let vc4 = UINavigationController(rootViewController:FourthViewController())
        vc4.title = "Fourth"
        let vc5 = UINavigationController(rootViewController:FifthViewController())
        vc5.title = "Fifth"
        
        self.tabBar.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
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
        
    }
}
