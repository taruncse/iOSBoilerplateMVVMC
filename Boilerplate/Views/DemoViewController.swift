//
//  DemoViewController.swift
//  Boilerplate
//
//  Created by DreamOnline on 4/1/21.
//

import UIKit

class DemoViewController: UIViewController, Storyboarded {
    var didSendEventClosure: ((DemoViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DemoViewController {
    enum Event {
        case second
    }
}
