import Foundation

// Protocolos delegados

class FirstClass: SecondClassProtocol {

    func call() {
        print("Estoy de vuelta (operación en firstClass)")
    }

    func callSecond() {
        let second = SecondClass()
        second.delegate = self
        second.callFirst()
    }
}

class SecondClass {
    var delegate: SecondClassProtocol?

    func callFirst() {
        print("Llamando a call en second class")
        sleep(5)
        delegate?.call()
    }
}

protocol SecondClassProtocol {
    func call()
}

let firstClass = FirstClass()
firstClass.callSecond()
