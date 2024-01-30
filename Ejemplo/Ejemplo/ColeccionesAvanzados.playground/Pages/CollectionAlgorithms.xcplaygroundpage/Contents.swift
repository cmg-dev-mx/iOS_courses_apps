import Foundation

// Algoritmos para colecciones

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

// Sort
// print(myArray)
// myArray.sort()
// print(myArray)

// myArray.sort { (a, b) -> Bool in
//     return a > b
// }
// print(myArray)

// MyDictionary.sort() No soportada
// mySet.sort() No soportada

// Sorted

print(myArray)
var myArraySorted = myArray.sorted() // No modifica el arreglo original
print(myArray)
print(myArraySorted)

myArraySorted = myArray.sorted { (a, b) -> Bool in
    return a > b
}
print(myArray)
print(myArraySorted)

let myDictionarySorted = myDictionary.sorted { (a, b) -> Bool in
    return a.key < b.key
}
print(myDictionarySorted)

var mySetSorted = mySet.sorted()
print(mySetSorted)

mySetSorted = mySet.sorted { (a, b) -> Bool in
    return a > b
}
print(mySetSorted)
