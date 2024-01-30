import UIKit

struct Cuadrado {

    // Propiedades
    var ancho = 10
    var alto = 10

    // Métodos
    func area() -> Int {
        return ancho * alto
    }
}

var miCuadrado = Cuadrado()
miCuadrado.area()


class Automovil {

    var color = "Neutro"
    var numLlantas = 4
    var precio = 0.0

    func encender() -> Bool {
        return true
    }

    func apagar() -> Bool {
        return false
    }

    func acelerar() -> Bool {
        return true
    }
}

var miAuto = Automovil()
miAuto.precio = 5000.0

print(miAuto.precio)
