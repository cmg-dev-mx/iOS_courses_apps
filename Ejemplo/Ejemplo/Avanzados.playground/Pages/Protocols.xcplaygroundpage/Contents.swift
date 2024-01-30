import Foundation

// Protocolos (interfaces)

protocol PersonProtocol {
    var name: String { get set }
    var age: Int { get set }

    func fullName() -> String
}

struct Programmer: PersonProtocol {
    func fullName() -> String {
        return "El nombre es \(name), edad: \(age) y su lenguaje favorito es \(language)"
    }
    var name: String
    
    var age: Int
    
    var language: String
}

struct Teacher: PersonProtocol {
    func fullName() -> String {
        return "El nombre es \(name), edad: \(age) e imparte la asignatura de \(subject)"
    }
    
    var name: String
    
    var age: Int
    
    var subject: String
}

let myProgrammer = Programmer(name: "Cesar", age: 36, language: "Kotlin")
let myTeacher = Teacher(name: "Juan", age: 50, subject: "Matemáticas")

print(myProgrammer.fullName())
print(myTeacher.fullName())
