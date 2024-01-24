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