//
//  DetailViewController.swift
//  Fabrica Automoviles
//
//  Created by Cesar Morales Garduño on 5/1/24.
//

import UIKit

class DetailViewController: UIViewController {

    var car: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let auto = car {
            switch auto {
                case 0:
                    print("Creating a basic car")
                case 1:
                    print("Creating a Mazda")
                default:
                    print("Creating a car")
           }
        }
    }
}
