//
//  ViewController.swift
//  Egg Timer
//
//  Created by Cesar Garduno on 12/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 8
    let hardTime = 12

    @IBAction func onClickHardnessSelected(_ sender: UIButton) {
        let hardness = sender.titleLabel?.text ?? "No title"
        
        let timeToCook = switch hardness {
            case "Soft":
                softTime
            case "Medium":
                mediumTime
            case "Hard":
                hardTime
            default: 0
        }
        
        print("Time to cook: \(timeToCook)")
    }
}

