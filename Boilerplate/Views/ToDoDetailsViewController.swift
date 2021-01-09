//
//  ToDoDetailsViewController.swift
//  Boilerplate
//
//  Created by DreamOnline on 5/1/21.
//

import Foundation
import UIKit

class ToDoDetailsViewController: UIViewController, Storyboarded {
    @IBOutlet var titleTbl: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    
    var isLoaded = false
    
    var viewModel : ToDoDetailsViewModelGuide? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            self.refreshDisplay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.title
        isLoaded = true
        refreshDisplay()
    }
    
    func refreshDisplay() {
        guard isLoaded else {
            return
        }
        
        if let viewModel = viewModel {
            self.titleTbl.text = viewModel.data?.title
            self.descriptionLbl.text = viewModel.data?.description
        }else {
            self.titleTbl.text = ""
            self.descriptionLbl.text = ""
        }
    }
    
    deinit {
        print("ToDoDetailsViewController finished")
    }
}

extension ToDoDetailsViewController : ToDoDetailsViewModelViewDelegate {
    func dataUpdated(_ viewModel: ToDoDetailsViewModelGuide) {
        refreshDisplay()
    }
}
