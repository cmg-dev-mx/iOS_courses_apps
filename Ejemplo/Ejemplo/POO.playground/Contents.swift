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

var objetoAuto = Automovil()
objetoAuto.precio = 1000.0

print(objetoAuto.precio)

struct EstructuraAutomovil {
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

var estructuraAuto = EstructuraAutomovil()
estructuraAuto.precio = 2000.0
print(estructuraAuto.precio)

var objetoAuto2 = objetoAuto
objetoAuto2.precio = 3000.0

var estructuraAuto2 = estructuraAuto
estructuraAuto2.precio = 7000.0

print("------------------")
print(objetoAuto.precio)
print(objetoAuto2.precio)
print(estructuraAuto.precio)
print(estructuraAuto2.precio)