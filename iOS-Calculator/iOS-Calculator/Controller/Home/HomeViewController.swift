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
    
    // MARK: - Variables

    private var total: Double = 0 // Total
    private var temp: Double = 0 // Valor por pantalla
    private var operating = false // Indicar si se ha seleccionado un operador
    private var decimal = false // Indicar si el valor es decimal
    private var operation: OperationType = .none // Operacion actual

    // MARK: - Constantes

    private enum OperationType {
        case none, addition, substraction, multiplication, division, percentage
    }

    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLength = 9
    private let kTotal = "total"

    // MARK: - Formateo de valores
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()

    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()

    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()

    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()

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

        comma.setTitle(kDecimalSeparator, for: .normal)

        total = UserDefaults.standard.double(forKey: kTotal)

        result()
    }
    
    // MARK: Button actions
    
    @IBAction func cleanAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func toggleSignAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func percentageAction(_ sender: UIButton) {

        if operation != .percentage {
            result()
        }

        operating = true
        operation = .percentage
        result()
        sender.shine()
    }
    
    @IBAction func divisionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .division

        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func multiplicationAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .multiplication

        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func substractionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .substraction

        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func additionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .addition

        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func equalsAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    @IBAction func commaAction(_ sender: UIButton) {
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }

        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true

        selectVisualOperation()

        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        clean.setTitle("C", for: .normal)

        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }

        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!

        // Hemos seleccionado una operacion
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }

        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }

        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))

        selectVisualOperation()

        sender.shine()
        print(sender.tag)
    }

    private func clear() {
        operation = .none
        clean.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }

    private func result() {
        switch operation {
        case .none:
            // No hacemos nada
            break
        case .addition:
            total += temp
            break
        case .substraction:
            total -= temp
            break
        case .multiplication:
            total *= temp
            break
        case .division:
            total /= temp
            break
        case .percentage:
            temp /= 100
            total = temp
            break
        }
        // Formateo en pantalla
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLength {
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }

        operation = .none

        selectVisualOperation()

        UserDefaults.standard.set(total, forKey: kTotal)

        print("Total: \(total)")
    }

    private func selectVisualOperation() {
        if !operating {
            return
        }

        switch operation {
        case .none, .percentage:
            addition.selectOperation(false)
            substraction.selectOperation(false)
            multiplication.selectOperation(false)
            division.selectOperation(false)
            break
        case .addition:
            addition.selectOperation(true)
            substraction.selectOperation(false)
            multiplication.selectOperation(false)
            division.selectOperation(false)
            break
        case .substraction:
            addition.selectOperation(false)
            substraction.selectOperation(true)
            multiplication.selectOperation(false)
            division.selectOperation(false)
            break
        case .multiplication:
            addition.selectOperation(false)
            substraction.selectOperation(false)
            multiplication.selectOperation(true)
            division.selectOperation(false)
            break
        case .division:
            addition.selectOperation(false)
            substraction.selectOperation(false)
            multiplication.selectOperation(false)
            division.selectOperation(true)
            break
        }
    }
}
