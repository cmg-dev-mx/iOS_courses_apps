//
//  ViewController.swift
//  Navigation
//
//  Created by Cesar Morales Garduño on 4/24/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickBtnYellow(_ sender: Any) {
        print("Click in yellow button")
        performSegue(withIdentifier: "VCYellow", sender: self)
    }
    
    @IBAction func onClickBtnGreen(_ sender: Any) {
        print("Click in green button")
        performSegue(withIdentifier: "VCGreen", sender: self)
    }
    
    @IBAction func onClickBtnPurple(_ sender: Any) {
        print("Click in purple button")
        performSegue(withIdentifier: "VCPurple", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VCYellow" {
            if let destiny = segue.destination as? YellowViewController {
                destiny.titulo = "Amarillo"
            }
        }

        if segue.identifier == "VCGreen" {
            if let destiny = segue.destination as? GreenViewController {
                destiny.titulo = "Verde"
            }
        }

        if segue.identifier == "VCPurple" {
            if let destiny = segue.destination as? PurpleViewController {
                destiny.titulo = "Morado"
            }
        }        
    }
}

