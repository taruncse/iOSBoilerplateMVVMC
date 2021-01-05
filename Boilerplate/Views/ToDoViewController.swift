//
//  DemoViewController.swift
//  Boilerplate
//
//  Created by DreamOnline on 4/1/21.
//

import UIKit

class ToDoViewController: UITableViewController, Storyboarded {

    var isLoaded : Bool = false
    
    var viewModel : ToDoViewModelGuide? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            refreshDisplay()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoaded = true
        refreshDisplay()
        // Do any additional setup after loading the view.
    }
    
    func refreshDisplay() {
        
        if let viewModel = viewModel, isLoaded {
            title = viewModel.title
        } else {
            title = ""
        }
        self.tableView.reloadData()
    }

}

extension ToDoViewController {
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let viewModel = viewModel {
            return viewModel.numberOfItems
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.todo = viewModel?.todoAtIndex(indexPath.row)

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.todoItemAtIndex(index: indexPath.row)
    }
}

extension ToDoViewController : ToDoViewModelViewDelegate {
    func itemsDidChange(viewModel: ToDoViewModelGuide) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
