//
//  HomeViewController.swift
//  iOS-Calculator
//
//  Created by Cesar Morales Garduño on 5/19/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var comma: UIButton!
    
    @IBOutlet weak var addition: UIButton!
    @IBOutlet weak var substraction: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var percentage: UIButton!
    @IBOutlet weak var toggleSign: UIButton!
    @IBOutlet weak var equals: UIButton!
    @IBOutlet weak var clean: UIButton!
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        comma.round()
        addition.round()
        substraction.round()
        multiplication.round()
        division.round()
        percentage.round()
        toggleSign.round()
        equals.round()
        clean.round()
    }
    
    // MARK: Button actions
    
    @IBAction func cleanAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func toggleSignAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func percentageAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func divisionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func multiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func substractionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func additionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func equalsAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func commaAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        sender.shine()
        print(sender.tag)
    }
}
