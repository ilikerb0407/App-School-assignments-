//: [Previous](@previous)

import Foundation


enum GuessNumberGameError: Error {
    case wrongNumber
}
class GuessNumerGame {
    var targetNumber = 10
    func guess(number: Int) throws{
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        return print("Guess the right number: \(targetNumber)")
    }
}

let guessNum = GuessNumerGame()

try guessNum.guess(number: 20)

//: [Next](@next)
