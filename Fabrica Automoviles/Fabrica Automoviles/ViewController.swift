//
//  ViewController.swift
//  Fabrica Automoviles
//
//  Created by Cesar Morales Garduño on 4/30/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var automovil = Automovil()
        print("El booleano que representa el automovil encendido es: \(automovil.encender())")
    }
}

