import Foundation

// Conjuntos

var mySet = Set<String>()
let mySet2: Set<String> = ["Juan", "Pedro", "Luis"] // No admite duplicados
let mySet3: Set = ["Juan", "Pedro", "Luis"] //Infiere que son Strings

// Inserción de uno a uno
mySet.insert("Cesar")
mySet.insert("36")
mySet.insert("Morales")
mySet.insert("Cesar")
mySet.insert("Juan")
mySet.insert("Pedro")
mySet.insert("Luis")

// Acceso
if (mySet.contains("Cesar")) {
    print("Si existe")
} else {
    print("No existe")
}

 // Modificación
mySet.remove("Cesar")
print(mySet)

// Acceso y modificacion por índice
if let index = mySet.firstIndex(of: "36") {
    mySet.remove(at: index)
}
print(mySet)

// Iteración

for myElement in mySet {
    print(myElement)
}

// Operaciones de conjuntos
let myIntSet: Set = [1, 2, 3, 4, 5]
let myIntSet2: Set = [4, 5, 6, 7, 8]

// Union
let myUnion = myIntSet.union(myIntSet2)
print(myUnion)

// Intersección
let myIntersection = myIntSet.intersection(myIntSet2)
print(myIntersection)

// Diferencia
let myDifference = myIntSet.symmetricDifference(myIntSet2)
print(myDifference)

// Substracción
let mySubtraction = myIntSet.subtracting(myIntSet2)
print(mySubtraction)
let mySubtraction2 = myIntSet2.subtracting(myIntSet)
print(mySubtraction2)
