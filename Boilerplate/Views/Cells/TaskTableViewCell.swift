//
//  TaskTableViewCell.swift
//  Boilerplate
//
//  Created by DreamOnline on 4/1/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var todo : ToDoDataModelGuide? {
        didSet {
            if let todo = todo {
                titleLbl.text = todo.title
                descriptionLbl.text = todo.description
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
