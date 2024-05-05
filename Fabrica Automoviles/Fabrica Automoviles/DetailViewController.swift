//
//  DetailViewController.swift
//  Fabrica Automoviles
//
//  Created by Cesar Morales Garduño on 5/1/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!

    var car: Int?

    var autoNormal: Automovil?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let auto = car {
            switch auto {
                case 0:
                    print("Creating a basic car")
                    autoNormal = Automovil()
                    label.text = "Se creo el auto básico correctamente"
                    image.image = UIImage(named: "auto")
                case 1:
                    print("Creating an electric")
                    autoNormal = AutoElectrico()
                    label.text = "Se creo el auto eléctrico correctamente"
                    image.image = UIImage(named: "bugati")
                    
                default:
                    print("Creating a car")
           }
        }
    }
    
    @IBAction func onClickShowInfo(_ sender: Any) {
        if let auto = autoNormal {
            if auto is AutoElectrico {
                label.text = "Color: \(auto.color) \nLlantas: \(auto.numLlantas) \nPrecio: \(auto.precio) \nEncendido: \(auto.encendido) \nBatería: \(String(describing: (auto as! AutoElectrico).porcentajeBateria))"
            } else {
                label.text = "Color: \(auto.color) \nLlantas: \(auto.numLlantas) \nPrecio: \(auto.precio) \nEncendido: \(auto.encendido)"
            }
        }
    }
    
    @IBAction func onClickTurnOn(_ sender: Any) {
        if let auto = autoNormal {
            if auto.encender() {
                label.text = "Auto encendido"
            } else {
                label.text = "No se pudo encender el auto"
            }
        }
    }
    
    @IBAction func onClickTurnOff(_ sender: Any) {
        if let auto = autoNormal {
            if auto.apagar() {
                label.text = "Auto apagado"
            } else {
                label.text = "No se pudo apagar el auto"
            }
        }
    }
    
    @IBAction func onClickAccelerate(_ sender: Any) {
        if let auto = autoNormal {
            label.text = auto.acelerar()
        }
    }
}
