import Foundation

// Type Casting (Validacion de tipos de datos)

let myString = "Cesar"
let myInt = 10

class MyClass {
    var name: String!
    var age: Int!
}

let myClass = MyClass()
myClass.name = "Cesar Morales"
myClass.age = 36

let myArray: [Any] = [myString, myInt, myClass]

for item in myArray {
    
    // Type casting
    if item is String {
        // Downcasting
        let myItemString = item as! String
        print("Item es de tipo String y tiene el valor de \(myItemString)")
    } else if item is Int {
        let myItemInt = item as! Int
        print("Item es de tipo Int y tiene el valor de \(myItemInt)")
    } else if item is MyClass {
        let myItemClass = item as! MyClass
        print("Item es de tipo MyClass y tiene el valor de \(myItemClass.name!) y \(myItemClass.age!)")
    }
}

for item in myArray {
    if let myItemString = item as? String {
        print("Item es de tipo String y tiene el valor de \(myItemString)")
    } else if let myItemInt = item as? Int {
        print("Item es de tipo Int y tiene el valor de \(myItemInt)")
    } else if let myItemClass = item as? MyClass {
        print("Item es de tipo MyClass y tiene el valor de \(myItemClass.name!) y \(myItemClass.age!)")
    }
}