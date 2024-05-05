//
//  Mazda.swift
//  Fabrica Automoviles
//
//  Created by Cesar Morales Garduño on 5/1/24.
//

import Foundation

class AutoElectrico: Automovil {

    var porcentajeBateria = 100

    func cargarBateria() -> String {
        porcentajeBateria = 100
        return "Batería cargada"
    }

    override func encender() -> Bool {
        if (porcentajeBateria == 0) {
            return false
        }
        return super.encender()
    }

    override func acelerar() -> String {
        if (encendido) {
            if (porcentajeBateria == 0) {
                encendido = false
                return "Batería vacía, auto apagado"
            }
            porcentajeBateria -= 10
            return "Aceleración exitosa"
        } else {
            return "No se puede acelerar si el auto está apagado"
        }
    }
}
