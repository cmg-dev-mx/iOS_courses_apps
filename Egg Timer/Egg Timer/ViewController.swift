//
//  ViewController.swift
//  Egg Timer
//
//  Created by Cesar Garduno on 12/12/24.
//

import UIKit

class ViewController: UIViewController {

    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]

    @IBAction func onClickHardnessSelected(_ sender: UIButton) {
        let hardness = sender.titleLabel?.text ?? "No title"
        
        let timeToCook = eggTimes[hardness] ?? 0
        
        print("Time to cook: \(timeToCook)")
    }
}

