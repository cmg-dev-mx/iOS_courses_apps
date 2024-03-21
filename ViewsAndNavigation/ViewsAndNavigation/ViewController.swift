//
//  ViewController.swift
//  ViewsAndNavigation
//
//  Created by Cesar Morales Garduño on 2/27/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myFakeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func myButtonAction(_ sender: Any) {
//        myView.isHidden = true
        myFakeView.isHidden = true
    }
}
