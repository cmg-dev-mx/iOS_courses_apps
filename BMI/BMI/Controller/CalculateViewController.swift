//
//  ViewController.swift
//  BMI
//
//  Created by Cesar Garduno on 12/18/24.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var sliderHeight: UISlider!
    @IBOutlet weak var sliderWeight: UISlider!
    
    var bmiValue: String = ""
    
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
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
        }
    }
}

