import Foundation

// Tipos Anidados

struct ChessPiece {

    let color: Color
    let type: PieceType

    enum Color: String {
        case White = "Blanco"
        case Black = "Negro"
    }

    enum PieceType: String {
        case King = "Rey"
        case Queen = "Reina"
        case Rock = "Torre"
        case Bishop = "Alfil"
        case Knight = "Caballo"
        case Pawn = "Peón"

        struct Number {
            let number: Int
        }

        var number: Number {
            switch self {
            case .King:
                return Number(number: 1)
            case .Queen:
                return Number(number: 1)
            case .Rock:
                return Number(number: 2)
            case .Bishop:
                return Number(number: 2)
            case .Knight:
                return Number(number: 2)
            case .Pawn:
                return Number(number: 8)
            }
        }
    }

    var description: String {
        if type.number.number == 1 {
            return "Hay \(type.number.number) pieza de ajedrez de color \(color.rawValue) y de tipo \(type.rawValue)"
        } else {
            return "Hay \(type.number.number) piezas de ajedrez de color \(color.rawValue) y de tipo \(type.rawValue)"
        }
    }
}

let myPiece = ChessPiece(color: .White, type: .Queen)
print(myPiece.description)
