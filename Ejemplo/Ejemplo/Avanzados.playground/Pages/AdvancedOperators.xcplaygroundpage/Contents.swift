import Foundation

// Precedencia y asociatividad

let myInt: Int = 2 + 3 % 4 * 5 // 2 + ((3 % 4) * 5) = 17
let myInt2: Int = (((2 + 3) % 4) * 5) // 5

// Más operadores avanzados

// - Operadores bit a bit: Realizar operaciones con bits de tipo NOT, AND, OR XOR
// - Operadores de desplazamiento: Desplazar bits hacia la izquierda o derecha
// - Operadores de desbordamiento: Manejar errores en valores por encima de su límite
// - Operadores custom: Definir operadores personalizados