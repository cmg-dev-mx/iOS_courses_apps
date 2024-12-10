//
//  ViewController.swift
//  Dice
//
//  Created by Cesar Garduno on 12/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgDiceLeft: UIImageView!
    @IBOutlet weak var imgDiceRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgDiceLeft.image = UIImage(named: "dice_1")
        imgDiceRight.image = UIImage(named: "dice_1")
    }

    @IBAction func noClickBtnThrow(_ sender: Any) {
        let leftDice = Int.random(in: 1...6)
        let rightDice = Int.random(in: 1...6)
        
        imgDiceLeft.image = UIImage(named: "dice_\(leftDice)")
        imgDiceRight.image = UIImage(named: "dice_\(rightDice)")
    }
}

