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
    @IBOutlet weak var sliderHeight: UISlider!
    @IBOutlet weak var sliderWeight: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHeight.text = "\(sliderHeight.value)m"
        lblWeight.text = "\(sliderWeight.value)Kg"
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
        let height = sliderHeight.value
        let weight = sliderWeight.value
        let bmi = weight / pow(height, 2)

        print("BMI: \(bmi)")
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.1f", bmi)
        self.present(secondVC, animated: true, completion: nil)
    }
}

