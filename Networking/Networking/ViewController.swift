//
//  ViewController.swift
//  Networking
//
//  Created by Cesar Morales Garduño on 6/15/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getUserAction(_ sender: Any) {
        NetworkingProvider.shared
            .getUser(id: 6940081)
    }
    
}

