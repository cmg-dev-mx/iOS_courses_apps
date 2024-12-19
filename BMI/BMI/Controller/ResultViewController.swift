//
//  ResultViewController.swift
//  BMI
//
//  Created by Cesar Garduno on 12/19/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblAdvice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResult.text = bmiValue
        lblAdvice.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func onCilckBtnRecalculate(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
