import UIKit

//1

enum Gasoline: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "diesel"
    
    func getPrice(rawValue : Gasoline ) -> String {
        switch rawValue {
    case .oil92 :
        return "the price is 10 dollars per liter"
    case .oil95 :
        return "the price is 20 dollars per liter"
    case .oil98 :
        return "the price is 30 dollars per liter"
    default :
        return "I can not remember this oiltype"
        }
    }
}

let getOilprice92 = Gasoline.oil92.getPrice(rawValue: .oil92)
print(getOilprice92)

let getOilprice95 = Gasoline.oil95.getPrice(rawValue: .oil95)
print(getOilprice95)

let getOilprice98 = Gasoline.oil98.getPrice(rawValue: .oil98)
print(getOilprice98)

let getdiesel = Gasoline.diesel.getPrice(rawValue: .diesel)
print(getdiesel)


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

let snowman = Pet(name: "snowman")
kevin2.pet = snowman


//

func getproperty1(people: People) {
    guard let unwrapped = people.pet else {
        print("You didn't have a pet")
        return
    }
    print("you have a pet called \(unwrapped.name)")
}

getproperty1(people: kevin)
getproperty1(people: kevin2)

func getproperty2(people:People) {
    if let unwrapped = people.pet {
        print("you have a pet called \(unwrapped.name)")
        return
    }
    print("You didn't have a pet !")
}

getproperty2(people: kevin)
getproperty2(people: kevin2)
