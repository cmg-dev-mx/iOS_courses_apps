//
//  YellowViewController.swift
//  Navigation
//
//  Created by Cesar Morales Garduño on 4/26/24.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    var titulo: String = ""
    var colorFondo: UIColor = .white

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = titulo
        view.backgroundColor = colorFondo
    }
}
