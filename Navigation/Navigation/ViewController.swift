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
        var titulo: String = ""
        var color: UIColor = .white
        switch segue.identifier {
            case "VCYellow" :
                titulo = "Amarillo"
                color = .yellow
            case "VCGreen":
                titulo = "Verde"
                color = .green
            case "VCPurple":
                titulo = "Morado"
                color = .purple
            default:
                titulo = ""
                color = .white
        }
        
        if let destiny = segue.destination as? SecondaryViewController {
            destiny.titulo = titulo
            destiny.colorFondo = color
        }
    }
}

