import UIKit

var greeting = "Hello, playground"

// Comentario sencillo

/*
 Comentario
 de varias
 lineas
 */

// - Variables y constantes

var str = "Hello world"
str = "Hola mundo"

let constante = "Texto constante"
// constante = "Valor cambiado" // Error: Una constante no puede ser actualizada

let nombreCompleto = "Juan Perez", edad = 23, peso = 70.5, lugarNacimiento = "Mexico"

// - Tipos de datos

// Enteros
let enteroImplicito = 20
let entero: Int = 23

// Flotantes
let flotanteImplicito = 8.5
let flotante: Float = 23.5
let doble: Double = 23.5

// Booleanos
let booleano: Bool = true

// Cadenas
let cadena: String = "Hola mundo"

// Interpolacion de cadenas
let nombre = "Juan"
let apellido = "Perez"
let nombreCompleto2 = "Mi nombre es \(nombre) \(apellido)"

// - Operadores

// Aritmeticos
let suma = 2 + 2
let resta = 4 - 2
let multiplicacion = 2 * 2
let division = 4 / 2
let modulo = 5 % 2

// Incremento y decremento
var numero = 0
numero += 1
numero -= 1

// Operadores de asignacion
var numero2 = 0
numero2 = numero

// Operadores de comparacion

// Igualdad
let numero3 = 3
let numero4 = 4
let numero5 = 3
numero3 == numero4
numero3 == numero5

// Desigualdad
numero3 != numero4
numero3 != numero5

// Mayor que
numero3 > numero4
numero4 > numero3

// Menor que
numero3 < numero4
numero4 < numero3

// Mayor o igual que
numero3 >= numero4
numero4 >= numero3
numero3 >= numero5

// Menor o igual que
numero3 <= numero4
numero4 <= numero3
numero3 <= numero5

// Operadores logicos

// AND
true && true
true && false
false && true
false && false

// OR
true || true
true || false
false || true
false || false

// NOT
!true
!false

// - Condicionales

// If
if numero3 == numero4 {
    print("Son iguales")
} else {
    print("No son iguales")
}

// Switch
switch numero3 {
case 1:
    print("Es 1")
case 2:
    print("Es 2")
case 3:
    print("Es 3")
default:
    print("No es ninguno")
}

// - Ciclos

// For
for i in 1...5 {
    print(i)
}

for i in 1..<5 {
    print(i)
}

for _ in 1...5 {
    print("Hola mundo")
}

// While
var contador = 0
while contador < 5 {
    print(contador)
    contador += 1
}

// Repeat while
contador = 0
repeat {
    print(contador)
    contador += 1
} while contador < 5

// - Funciones

func saluda() {
    print("Hola mundo")
}

saluda()

func suma(a: Int, b: Int) -> Int {
    return a + b
}

suma(a: 2, b: 3)

func suma2(_ a: Int, _ b: Int) -> Int {
    return a + b
}

suma2(2, 3)

func suma3(a: Int, b: Int = 0) -> Int {
    return a + b
}

suma3(a: 2, b: 3)
suma3(a: 2)
