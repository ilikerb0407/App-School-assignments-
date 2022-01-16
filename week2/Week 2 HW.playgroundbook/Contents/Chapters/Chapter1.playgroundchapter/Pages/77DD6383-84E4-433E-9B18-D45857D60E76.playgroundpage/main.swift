
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
    override init (gender:Gender, name:String){
        super.init(gender: <#T##Gender#>, name: <#T##String#>)
    }
    override func eat() {
        print("I eat apples")
    }
}
class Tiger: Animal {
    override init (gender:Gender, name:String){
        super.init(gender: <#Gender#>, name: <#String#>)
    }
    override func eat() {
        print("I eat Horse")
    }
}
class Horse: Animal {
    override init (gender:Gender, name:String){
        super.init(gender: <#T##Gender#>, name: <#T##String#>)
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

    //4



