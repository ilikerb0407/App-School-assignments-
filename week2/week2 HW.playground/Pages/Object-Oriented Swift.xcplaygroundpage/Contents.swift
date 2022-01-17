

import Foundation


//1
enum Gender {
    case male
    case female
    case undefined
}
class Animal {
    var gender : Gender
    var name: String
    init (gender: Gender, name: String){
        self.gender = gender
        self.name = name
    }
    
    func eat()  {
        print("I eat everything!")
}
}
//2
class Elephant: Animal {
    override init(gender: Gender, name: String) {
        super.init(gender: gender, name: name )
    }
override func eat() {
        print("I eat apples")
    }
}
class Tiger: Animal {
    override init(gender: Gender, name: String) {
        super.init(gender: gender, name: name)
    }
    override func eat() {
        print("I eat Horse")
    }
}
class Horse: Animal {
    override init(gender: Gender, name: String) {
        super.init(gender: gender, name: name)
    }
    override func eat() {
        print("I eat Elephant XD")
    }
}
//3
class Zoo {
    
    var weeklyHot: Animal
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}
let zoo = Zoo(weeklyHot:Tiger(gender: Gender.male, name: "Leo"))
var tiger = Tiger(gender: Gender.male, name: "Koko")
zoo.weeklyHot = tiger
var elephant = Elephant(gender: Gender.female, name: "Trump")
zoo.weeklyHot = elephant
var horse = Horse(gender: Gender.undefined, name: "BaiDun")
zoo.weeklyHot = horse

//4 structure 是數值型別 -當這類型被指愛一個變數的時候，會創建一個新的備份 ;Class 是參考型別 - 當這類型被指派一個變數或是函數的時候，會共享一樣的備份

//5 instance 方法需要先建立一個實例才可以使用這個實例裡的方法， type 方法無需建立一個實例

//6 Structure 在宣告變數的時候,會有一個預設的initializer 來初始化變數 , 在呼叫的時候要定義外部參數的名稱, 但是也可以客製化一個initializer 來宣告變數的屬性,這樣原先預設的initializer 就會失去作用Class 的initialize 分為三種,第一個是宣告變數並且鄧給定初始值. 第二種是宣告變數為optional , 第三種在宣告變數的時候可以是預設值或是藉由參數傳遞回去

//7 self 在instance method 中所代表的是instance 本身, 在type method 中代表的是type本身，這幫助編輯器可以不會誤認相同參數名稱所指的參數是哪個

//8 數值型別 ── 每個實例保存資料一份獨立的備份。當這類型別被指派給一個變數或常數、或是被傳送到函式時，就會創建一個新的實例（備份）。 參考型別 ── 每個實例共享資料的單一備份。當這類型別被初始化、被指派給一個變數或常數、或者是被傳送到函式時，就會回傳參考到相同的實例。

