//
//  SecondViewController.swift
//  BMI
//
//  Created by Cesar Garduno on 12/19/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "\(bmiValue)"
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.addSubview(label)
        view.backgroundColor = .systemBlue
    }
}
