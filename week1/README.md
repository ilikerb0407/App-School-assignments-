This is my week1 HW


Git& GitHub

//1 repository link : https://github.com/ilikerb0407/App-School-assignments-.git

//2

git status = 顯示repo 目前的工作狀態

git add = 在編輯檔案之後要執行的功能，可以把已修改的內容新增到repo

git commit = 再上傳到自己的github 之前，可以對自己剛剛所編輯的動作做簡單的紀錄說明

git log = 可以顯示編輯repo的所有歷史紀錄

git push = 將自己做的修改動作上傳到自己的Github

git remote -v = 想要將自己桌面所建立的檔案藉由git 上傳到GitHub 之前要做的初始化動作

git branch = 講整體的開發流程分開儲存

git fork = fork 可以從別人github 請求拿 repo到自己的github,做完新的branches後在pull request 回別人的github  

//3 [自己建立LICENSE & README.md]

cd Desktop --> mkdir newfile --> cd newfile --> git init = create the new repo --> vim LICENSE = 建立License --> 輸入年份和姓名 --> check status 會發現有untracked file --> git add newfile --> vim README.md --> insert i = 做編輯, 編輯完之後,esc [:wq] --> 有了 LICENSE & README.md 就可以push 到自己的GitHub
 --> 到GitHub 建立一個新的repo，copy http link --> cd 到Desktop/newfile --> git remote add origin [paste http formed by new repo] --> git remote -vv [出現 fetch & push] --> git push —set-upstream origin master --> 在GitHub 上面建立一個新的token 並且copy 密碼 --> 輸入 user name 和 token 密碼 --> git status, log 檢查工作狀態 --> 去自己的Github 重新整理檢查是否有新增repo 成功

[clone]
去自己的GitHub 建立新的repo 並且選擇LICENSE & README.md --> copy http link --> cd Desktop --> git clone [repo http link] --> 新的repo 就會出現在local Desktop --> upload the local project to Github

-----------------------------------------------
Basic 
//1 
let Pi = 3.1415

//2
let x: Int = 20
let y: Int = 40
let average = (x+y)/2
print ("The average result of x+y is: \(average) ")

//3-1
let avg = Double((x+y)/2)
print ("The average result of x+y is: \(avg) ")

//3-2一個是整數運算，另外一個是小數點運算

//4 
var flag : Bool = true
var inputString : String = "Hello world."
let bitsInBite : Int = 8
let averageScore : Double = 86.8

//5
var Salary = 22000
Salary += 28000
print(Salary)

//6
2 == 2
"Kevin" == "Kevin"

//7
let value1 = 10
let value2 = 3
let remainder = value1%value2
print (remainder)

//8 var宣告的變數可以改變, let 不行
//9 變數、函式聲明的命名規則還是以 lowerCamelCase 為基礎。常數通常使用 enum 類型定義。類和其他類型的聲明採用 UpperCamelCase
//10 當電腦在辨識value的時候，會自動推斷value 的種類
//11 不能指定一個字串給原本是整數的變數

------------------------------
Collection 

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
myCountryNumber.removeAll()
print (myCountryNumber)

-------------------------------------------
ControlFlow 
//1
let lottoNumbers = [10, 9, 8, 7, 6, 5]
for i in 3...5 {
    print (lottoNumbers[i])
}

//2
var array = [5,6,7,8,9,10]
array.reverse()
print(array)
for i in array {
    if (i % 2 == 0) {
        print (i)
    }
}

//3
var i = 10
var n = 5 
while i >= n {
    if (i%2 == 0){
        print (i)
    }
    i -= 1
}

//4
i = 10
n = 5
repeat {
    if (i%2 == 0){
        print (i)
    }
    i -= 1
} while i>=n

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

---------------------------------------------
Function
//1
func greet (person: String) -> String {
    return "Hello, \(person)"
}
print (greet(person:"Luke"))

//2
func multiply(a :Int , b :Int)-> Int{
    let b = 10
    return multiply(a: a, b:b)
}
print ("a*b")


//3 argument label 是在呼叫function 時候的外部參數, parameter name 是寫在function內的參數 "
    
//4 第一個顯示的type是字串，第二個顯示的type是數字
