//
//  ViewController.swift
//  FirebaseTutorial
//
//  Created by Cesar Garduno on 7/17/24.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("HomeScreen", parameters: ["message": "Integracion de Firebase completada"])
    }


}

