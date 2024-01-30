import Foundation

// Enlaces opcionales

var myOptionalString: String?
var myOptionalString2: String?
var myOptionalString3: String?

myOptionalString = "Cesar"
myOptionalString2 = "Morales"
myOptionalString3 = "36"

if let myString = myOptionalString, let myString2 = myOptionalString2, let myString3 = myOptionalString3 {
    print("\(myString), \(myString2), \(myString3)")
} else {
    print("Alguna variable es nula")
}

// Desempaquedato forzado

if myOptionalString != nil {
    print(myOptionalString!)
}

