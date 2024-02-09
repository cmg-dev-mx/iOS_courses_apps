//
//  ViewController.swift
//  Ejemplo Proyecto
//
//  Created by Cesar Garduno on 2/9/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        etiqueta.text = "Ya cambie"
    }
    
    @IBAction func cambiarTexto(_ sender: Any) {
        etiqueta.text = "Texto cambiado por el botón"
        etiqueta.text = "Cambio 2"
        etiqueta.text = "Cambio 3"
        etiqueta.text = "Cambio 4"
        etiqueta.text = "Cambio 5"
    }
}

