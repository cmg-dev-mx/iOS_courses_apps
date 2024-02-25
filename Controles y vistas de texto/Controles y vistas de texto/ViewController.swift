//
//  ViewController.swift
//  Controles y vistas de texto
//
//  Created by Cesar Garduno on 2/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    // Variables
    private let myPickerViewValues = [
        "Uno",
        "Dos",
        "Tres",
        "Cuatro",
        "Cinco"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Buttons
        myButton.setTitle("Mi botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        // Pickers
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        // PageControls
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        // SegmentedControls
        mySegmentedControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated() {
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        // Slider
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 1
        
        // Stepper
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        // Switch
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
        
        // ProgressIndicator
        myProgressView.progress = 0
        
        myActivityIndicator.color = .orange
        myActivityIndicator.startAnimating()
        myActivityIndicator.hidesWhenStopped = true
        
        // Labels
        myStepperLabel.textColor = .darkGray
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 36)
        myStepperLabel.text = "1"
        
        mySwitchLabel.text = "Está apagado"
        
        // Text field
        myTextField.textColor = .brown
        myTextField.placeholder = "Escribe algo"
        myTextField.delegate = self
        
        // Text view
        myTextView.textColor = .brown
        myTextView.delegate = self
        
    }
    
    // Actions

    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .blue
        }

        myTextView.resignFirstResponder()
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        let index = myPageControl.currentPage
        let myString = myPickerViewValues[index]
        
        myButton.setTitle(myString, for: .normal)
        myPickerView.selectRow(index, inComponent: 0, animated: true)
        mySegmentedControl.selectedSegmentIndex = index
        mySlider.value = Float(index + 1)
        myStepper.value = Double(index + 1)
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        let index = mySegmentedControl.selectedSegmentIndex
        let myString = myPickerViewValues[index]
        
        myButton.setTitle(myString, for: .normal)
        myPickerView.selectRow(index, inComponent: 0, animated: true)
        myPageControl.currentPage = index
        mySlider.value = Float(index + 1)
        myStepper.value = Double(index + 1)
    }

    @IBAction func mySliderAction(_ sender: Any) {
        let index = Int(mySlider.value) - 1
        let myString = myPickerViewValues[index]
        
        let progress = Double(index + 1) / Double(myPickerViewValues.count)
        
        myButton.setTitle(myString, for: .normal)
        myPickerView.selectRow(index, inComponent: 0, animated: true)
        myPageControl.currentPage = index
        mySegmentedControl.selectedSegmentIndex = index
        myStepper.value = Double(index + 1)
        
        myProgressView.progress = Float(progress)
    }
    
    @IBAction func myStepperAction(_ sender: Any) {
        let index = Int(myStepper.value) - 1
        let myString = myPickerViewValues[index]
        
        myButton.setTitle(myString, for: .normal)
        myPickerView.selectRow(index, inComponent: 0, animated: true)
        myPageControl.currentPage = index
        mySegmentedControl.selectedSegmentIndex = index
        mySlider.value = Float(index + 1)
        
        myStepperLabel.text = "\(index + 1)"
    }
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn {
            myPickerView.isHidden = false
            myActivityIndicator.stopAnimating()
            mySwitchLabel.text = "Está encendido"
        } else {
            myPickerView.isHidden = true
            myActivityIndicator.startAnimating()
            mySwitchLabel.text = "Está apagado"
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let index = row
        let myString = myPickerViewValues[index]
        
        myButton.setTitle(myString, for: .normal)
        myPageControl.currentPage = index
        mySegmentedControl.selectedSegmentIndex = index
        mySlider.value = Float(index+1)
        myStepper.value = Double(index + 1)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        myTextField.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        myTextField.isHidden = false
    }
}
