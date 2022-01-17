import UIKit

//1

enum Gasoline: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "diesel"
    
    
    func getPrice() -> String{
        switch Gasoline(rawValue: <#String#>){
        case .oil92 :
            return "the price is 10 dollars per liter"
        case .oil95 :
            return "the price is 20 dollars per liter"
        case .oil98 :
            return "the price is 30 dollars per liter"
        default:
            Void.self
        }
        return getPrice()
    }
}
// associated value 可以讓值放在變數中，先判斷變數是哪個case, 最後在用let 取出在enum 中的值

//2

class Pet {
    var name : String
    init (name:String){
        self.name = name
    }
}
class People {
    var pet : Pet? = nil
}
let kevin = People()
var kevin2 = People()

let putin = Pet(name: "snowman")
kevin2.pet = putin


//

func getproperty1(people: People) {
    guard let unwrapped = people.pet else {
        print("You didn't have a pet")
        return
    }
    print(unwrapped.name)
}

getproperty1(people: kevin)
getproperty1(people: kevin2)

func getproperty2(people:People) {
    if let unwrapped = people.pet {
        print(unwrapped.name)
        return
    }
    print("You didn't have a pet !")
}

getproperty2(people: kevin)
getproperty2(people: kevin2)