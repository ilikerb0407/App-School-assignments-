
//1
let lottoNumbers = [10, 9, 8, 7, 6, 5]
for i in 3...5 {
    print (lottoNumbers[i])
}
print ("hheheheheheh1")

//2

let lottoNum :[Int] = lottoNumbers.reversed()
for i in 0..<lottoNum.count{
    print(lottoNum[i])
}

for i2 in lottoNumbers {
    if (i2 % 2 == 0) {
        print (i2)
    }
}

print ("hheheheheheh2")
//3
var i = 0
let lottoNum1 :[Int] = lottoNumbers.reversed()

while i < lottoNum1.count {
    print(lottoNum1[i])
    i+=1 
}


i = 0 
while  i < lottoNumbers.count  {
    if (lottoNumbers[i]%2 == 0){
        print(lottoNumbers[i])
    }
    i += 1
    }

print ("hheheheheheh4")
//4
i = 0 

let lottoNum2 :[Int] = lottoNumbers.reversed()
repeat {
    print(lottoNum2[i])
    i += 1
} while i < lottoNum2.count

    
print ("hheheheheheh5")
i = 0
repeat {
    if (lottoNumbers[i] % 2 == 0) { 
        print (lottoNumbers[i])
    }
    i += 1
    
} while i < lottoNumbers.count
//5 repeat while 會先執行程式在檢查條件, while 則是先檢查條件在執行程式

//6
var isRaining: String = "raining"
if isRaining == "raining" { 
    print("It’s raining, I don’t want to work today.")}
    else{
    print ("Although it’s sunny, I still don’t want to work today.")
}

//7
var jobLevel = [1,2,3,4]
for i in jobLevel {
    if i == 1{
        print ("Member")
    }
    else if i == 2 {
        print ("Team Leader")
    }
    else if i == 3 {
        print ("Manager")
    }
    else if i == 4 {
        print ("director")
    }
    else {
        print ("We don't have this job")
    }
}





