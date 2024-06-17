//
//  ViewController.swift
//  Networking
//
//  Created by Cesar Morales Garduño on 6/15/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
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
            .getUser(id: 6965768, success: { user in
                self.activityIndicator.stopAnimating()
                self.titleLb.text = "\(user.id?.description ?? ""): \(user.name?.description ?? "")"
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

    @IBAction func addUserAction(_ sender: Any) {
        let user = UserRequest(name: "Cesar", email: "cesar@mail.como", gender: "male", status: "active")

        activityIndicator.startAnimating()

        NetworkingProvider.shared
            .addUser(user: user, success: { user in
                self.activityIndicator.stopAnimating()
                self.titleLb.text = "\(user.id?.description ?? ""): \(user.name?.description ?? "")"
                self.descriptionLb.text = user.email
            }, failure: { error in
                self.activityIndicator.stopAnimating()
                print(error)
            })
    }
    
    @IBAction func downloadImageAction(_ sender: Any) {
        logoImageView.kf.setImage(with: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Android_logo_2019.png/599px-Android_logo_2019.png"))
    }
}
