
//1
var myFriends: [String] = []

//2
myFriends.append(contentsOf: ["Lan","Bomi","Kevin"])
print (myFriends)

//3
myFriends.insert("Michael", at: myFriends.count)
print(myFriends)

//4
myFriends.swapAt(2, 0)

//5
for friends in myFriends {
    print(friends, terminator: " ")
}

//6 index 5 out of range 所以會出現error

//7
print(myFriends[0])

//8
print(myFriends[myFriends.count-1])

//9
var myCountryNumber: [String :Int] = [:]

//10
myCountryNumber["US"] = 1
myCountryNumber["GB"] = 44
myCountryNumber["JP"] = 81
print(myCountryNumber)

//11
myCountryNumber["GB"] = 0
print(myCountryNumber)

//12 宣告變數為 = [:] example: varNameofInt :[Int:String] = [:]

//13
myCountryNumber["US"] = nil
print(myCountryNumber)
