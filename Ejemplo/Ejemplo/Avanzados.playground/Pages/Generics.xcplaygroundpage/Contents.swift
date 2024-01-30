import Foundation

// Genéricos

// Sin genericos
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

func swapTwoGenerics<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
swapTwoGenerics(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")