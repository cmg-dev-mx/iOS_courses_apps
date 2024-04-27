//
//  GreenViewController.swift
//  Navigation
//
//  Created by Cesar Morales Garduño on 4/26/24.
//

import UIKit

class GreenViewController: UIViewController {

    var titulo: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let capturedTitle = titulo {
            self.title = capturedTitle
        }
    }
}
