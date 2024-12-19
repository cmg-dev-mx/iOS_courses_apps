//
//  ResultViewController.swift
//  BMI
//
//  Created by Cesar Garduno on 12/19/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblAdvice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResult.text = bmiValue
    }
    
    @IBAction func onCilckBtnRecalculate(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
