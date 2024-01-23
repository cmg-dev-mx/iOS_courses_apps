import UIKit

// Nombre de parámetros internos y externos

func calificacionPromedio(
    matematicas materia1: Double,
    quimica materia2: Double,
    fisica materia3: Double
) -> Double {
    return (materia1 + materia2 + materia3) / 3
}

let miCalificacionPromedio = calificacionPromedio(
    matematicas: 10,
    quimica: 9,
    fisica: 8
)

print(miCalificacionPromedio)

// Closures

/*
 {
 (parametros) -> TipoValorRetorno in
 codigo
 }
 
 */

// calificacionPromedio como closure

let calificacionPromedioClosure = {
    (materia1: Double, materia2: Double, materia3: Double) -> Double in
    return (materia1 + materia2 + materia3) / 3
}

print(calificacionPromedioClosure(10, 9, 8))

print("Mi calificacion promedio fue de \(calificacionPromedio(matematicas: 8, quimica: 6, fisica: 7))")
print("Mi calificacion promedio fue de \(calificacionPromedioClosure(8, 6, 9))")
