//
//  ViewController.swift
//  BMI
//
//  Created by Cesar Garduno on 12/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onHeightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        lblHeight.text = "\(height)m"
    }
    
    @IBAction func onWeightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        lblWeight.text = "\(weight)Kg"
    }
    
    @IBAction func onClickBtnCalculate(_ sender: Any) {
    }
}

