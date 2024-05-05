//
//  Automovil.swift
//  Fabrica Automoviles
//
//  Created by Cesar Morales Garduño on 4/30/24.
//

import Foundation

class Automovil {

    var color = "neutro"
    var numLlantas = 4
    var precio = 5000

    var encendido: Bool = false

    func acelerar() -> String {
        if (encendido) {
            return "Aceleración exitosa"
        } else {
            return "No se puede acelerar si el auto está apagado"
        }
    }

    func encender() -> Bool {
        if (encendido) {
            return false
        } else {
            encendido = true
            return true
        }        
    }

    func apagar() -> Bool {
        if (encendido) {
            encendido = false
            return true
        } else {
            return false
        }
    }
}