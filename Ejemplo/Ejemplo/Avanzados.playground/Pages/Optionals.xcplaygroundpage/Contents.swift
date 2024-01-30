import Foundation

let myStringNumber = "100"
let myIntNumber = Int(myStringNumber)

let myWrongStringNumber = "Cesar"
let myWrongIntNumber = Int(myWrongStringNumber)

var myOptionalString: String?
print(myOptionalString)

myOptionalString = "Bienvenido al curso de Swift"

if myOptionalString != nil {
    print("Nuestra variable tiene un valor distinto de nulo")
} else {
    print("Nuestra variable es nula")
}