import UIKit

// Colecciones

// Arrays

var arregloNumeros = [1,2,3,4,5,6,7,8,9,10]

let arregloNumerosInmutable = [1,2,3,4,5,6,7,8,9,10]

print(4)

print(arregloNumeros[4])

// Agregar valores
arregloNumeros.append(11)
arregloNumeros.insert(4, at: 3)

// Eliminar valores
arregloNumeros.remove(at: 3)
arregloNumeros.removeLast()

// Eliminar todos los valores
arregloNumeros.removeAll()

// Arreglo vacio
var arregloVacio: [Int] = []

print(arregloVacio)

// Diccionarios

// Definicion de diccionario de forma clasica
// var diccionarioClasico = [String:Any]()
// var diccionarioClasico2 = Dictionary<String, Any>()

var diccionario = ["nombre":"Juan", "apellido":"Perez", "edad": 25] as [String : Any]

diccionario["direccion"] = "Calle 123"

print(diccionario["nombre"]!)
print(diccionario["edad"]!)

diccionario["nombre"] = "Pedro"
print(diccionario["nombre"]!)

diccionario.removeValue(forKey: "edad")
print(diccionario)

diccionario.removeValue(forKey: "nombre")

// Tuplas

var tupla = ("Juan", "Perez", 25)

var tuplaNombrada = (nombre: "Juan", apellido: "Perez", edad: 25)

print(tuplaNombrada.nombre) // tupla.0
print(tuplaNombrada.apellido) // tupla.1
print(tuplaNombrada.edad) // tupla.2

var (nombre, apellido, edad) = tupla

tuplaNombrada.nombre = "Pedro"
print(tuplaNombrada.nombre)

// Enumeraciones

enum DiasSemana {
    case lunes
    case martes
    case miercoles
    case jueves
    case viernes
    case sabado
    case domingo
}

var dia = DiasSemana.lunes

enum PersonalData {
    case name
    case surname
    case address
    case phone

    // Tambien se puede definir de la siguiente forma
    // case name, surname, address, phone
}

var currentData: PersonalData = .name
var input = "Juan"

currentData = .phone
input = "123456789"

// Enumeraciones con valores asociados

enum ComplexPersonalData {
    case name(String)
    case surname(String, String)
    case address(String, Int)
    case age(Int)
}

var complexData: ComplexPersonalData = .name("Juan")
complexData = .surname("Perez", "Gonzalez")
complexData = .address("Calle Falsa", 123)
complexData = .age(25)

// Enumeraciones con el mismo tipo de valor

enum RawPersonalData: String {
    case name = "Nombre"
    case surname = "Apellido"
    case address = "Direccion"
    case phone = "Telefono"
}

print(RawPersonalData.name.rawValue)

// Range operators

// Operador de rango cerrado

for i in 1...10 { // Rango [1,10]
    print(i)
}

// Operador de rango semiabierto

for i in 1..<10 { // Rango [1,10)
    print(i)
}

var numbers = [1,2,3,4,5,6,7,8,9,10]
print(numbers)
var subArray1 = numbers[...3]
print(subArray1)
var subArray2 = numbers[4...]
print(subArray2)

var rangoCerrado = 1...5
var arrayfromRange = Array(rangoCerrado)
print(arrayfromRange)
