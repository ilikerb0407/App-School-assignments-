

let coffee = ["oat lattee", "cappuchino","moka"]
let counts = coffee.count
for i in 0..<counts{
    print ("Coffee \(i+1) is called \(coffee[i])")
}

for coffees in coffee[...1]{
    print (coffees)
}

for _ in 1...5 {
    for _ in 1...10{
        print ("*", terminator: "")
    }
    print ()
}

var pastries: [String] = ["cookies", "danish", "cupcake", "donut","pie","browine","fritter","crulle"]
for pastry in pastries {
    if pastries.count > 5 {
        continue
    }
    print (pastry)
}

let daysOfTheWeek: [String] = ["Sun","Mon","Tue","Wed","Thurs","Fri","Sat"]

for Date in daysOfTheWeek {
    if Date == "Sun" {
        continue
        }
    print(Date)
    if Date == "Fri" {
        break
    }
}

