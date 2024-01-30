import Foundation

// Extensiones

let myMeters: Double = 5000

func metersToKilometers(meters: Double) -> Double {
    return meters / 1000.0
}

print(metersToKilometers(meters: myMeters))

extension Double {
    var km: Double { return self / 1000.0 }
    var m: Double { return self }
    var cm: Double { return self * 100.0 }
    var mm: Double { return self * 1000.0 }
    var ft: Double { return self / 3.28084 }
}

print(myMeters.km)