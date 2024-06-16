//
//  ViewController.swift
//  Networking
//
//  Created by Cesar Morales Garduño on 6/15/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var descriptionLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLb.text = ""
        descriptionLb.text = ""
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }

    @IBAction func getUserAction(_ sender: Any) {
        activityIndicator.startAnimating()

        NetworkingProvider.shared
            .getUser(id: 6940081, success: { user in
                self.activityIndicator.stopAnimating()
                self.titleLb.text = user.name
                self.descriptionLb.text = user.email
            }, failure: { error in
                self.activityIndicator.stopAnimating()
                print(error)
            })
    }
    
    @IBAction func getTodoAction(_ sender: Any) {
        activityIndicator.startAnimating()

        NetworkingProvider.shared
            .getTodo(id: 54381, success: { todo in
                self.activityIndicator.stopAnimating()
                self.titleLb.text = todo.title
                self.descriptionLb.text = "\(todo.dueOn)"
            }, failure: { error in
                self.activityIndicator.stopAnimating()
                print(error)
            })
    }
}
