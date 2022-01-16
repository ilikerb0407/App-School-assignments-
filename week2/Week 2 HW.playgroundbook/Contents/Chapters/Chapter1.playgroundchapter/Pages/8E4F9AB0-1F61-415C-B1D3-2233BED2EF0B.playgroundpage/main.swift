
enum GuessNumberGameError: Error {
    case wrongNumber 
    
    
}
class GuessNumerGame:GuessNumberGameError {
    var targetNumber = 10
    self.init (number:Int)
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        
        print("Guess the right number: \(targetNumber)")
    }
}
GuessNumerGame.guess(number:20)





