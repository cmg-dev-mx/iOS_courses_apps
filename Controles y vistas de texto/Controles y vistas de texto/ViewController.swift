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
    }
    
    // Actions

    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        let index = myPageControl.currentPage
        let myString = myPickerViewValues[index]
        
        myButton.setTitle(myString, for: .normal)
        myPickerView.selectRow(index, inComponent: 0, animated: true)
        mySegmentedControl.selectedSegmentIndex = index
        mySlider.value = Float(index+1)
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        let index = mySegmentedControl.selectedSegmentIndex
        let myString = myPickerViewValues[index]
        
        myButton.setTitle(myString, for: .normal)
        myPickerView.selectRow(index, inComponent: 0, animated: true)
        myPageControl.currentPage = index
        mySlider.value = Float(index+1)
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        let index = Int(mySlider.value) - 1
        let myString = myPickerViewValues[index]
        
        myButton.setTitle(myString, for: .normal)
        myPickerView.selectRow(index, inComponent: 0, animated: true)
        myPageControl.currentPage = index
        mySegmentedControl.selectedSegmentIndex = index
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
    }
}
