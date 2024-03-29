import Foundation

// Algoritmos para colecciones (Iteración)

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

// ForEach

myArray.forEach { (a) in
    print(a)
}

myDictionary.forEach { (a) in
    print(a.value)
}

mySet.forEach { (a) in
    print(a)
}