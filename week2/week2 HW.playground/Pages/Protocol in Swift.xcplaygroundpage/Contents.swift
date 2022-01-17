//: [Previous](@previous)

import Foundation

//1 & 2 & 4
struct Person: PoliceMan {
    func arrestCriminals() {}
    var toolMan : ToolMan
    var name: String
}
protocol PoliceMan {
    var name : String {get}
    func arrestCriminals()
}

//3
protocol ToolMan {
    func fixComputer()
}

//5
struct Engineer: ToolMan {
    func fixComputer() {}
}
//6

var person = Person(toolMan: Engineer(), name: "Steven")




//: [Next](@next)
