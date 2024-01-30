import Foundation

// Algoritmos para colecciones (Map)

var myArray = [5, 8, 1, 0, 3, 9, 7, 2, 4, 6]

let myDictionary = [
    5: "Cinco",
    8: "Ocho",
    1: "Uno",
    0: "Cero",
    3: "Tres",
    9: "Nueve",
    7: "Siete",
    2: "Dos",
    4: "Cuatro",
    6: "Seis"
]

let mySet: Set = [5, 8, 1, 0, 3, 9, 7, 2, 4, 6]

// Map

let myMapArray = myArray.map { (a) -> Int in
    return a + 10
}
print(myMapArray)

let myStringMapArray = myArray.map { (a) -> String in
    return "Este es el número \(a)"
}
print(myStringMapArray)

let myIntMapArray = myDictionary.map { (a) -> Int in
    return a.key
}
print(myIntMapArray)

let myStringMapSet = mySet.map { (a) -> String in
    return "\(a)"
}
print(myStringMapSet)
