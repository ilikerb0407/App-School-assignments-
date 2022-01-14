This is my week1 HW


Git& GitHub

//1 repository link : https://github.com/ilikerb0407/App-School-assignments-.git

//2

git status = 顯示repo 目前的工作狀態

git add = 在編輯檔案之後要執行的功能，可以把已修改的內容新增到repo

git commit = 再上傳到自己的github 之前，可以對自己剛剛所編輯的動作做簡單的紀錄說明

git log = 可以顯示編輯repo的所有歷史紀錄

git push = 將自己做的修改動作上傳到自己的Github

git remote -v = 在做遠端連線的時候，可以顯示遠端repo的網址

git branch = 為了在一個專案中可以同時進行不同的的修改，有了分支的概念，在初次提交的時候會有一個主要分支叫master, 可以在主要的分支上分出幾個分支做不同的事情但是卻不會影響master的內容, branch 可以讓自己知道自己目前在哪的分支上面做事情，也可以最後再合併到master上面.

git fork = fork 可以從別人github 請求拿 repo到自己的github,做完新的branches後在pull request 回別人的github  

//3 
[自己建立LICENSE & README.md]

cd Desktop --> mkdir newfile --> cd newfile --> git init = create the new repo --> vim LICENSE = 建立License --> 輸入年份和姓名 --> check status 會發現有untracked file --> git add newfile --> vim README.md --> insert i = 做編輯, 編輯完之後,esc [:wq] --> 有了 LICENSE & README.md 就可以push 到自己的GitHub
 --> 到GitHub 建立一個新的repo，copy http link --> cd 到Desktop/newfile --> git remote add origin [paste http formed by new repo] --> git remote -vv [出現 fetch & push] --> git push —set-upstream origin master --> 在GitHub 上面建立一個新的token 並且copy 密碼 --> 輸入 user name 和 token 密碼 --> git status, log 檢查工作狀態 --> 去自己的Github 重新整理檢查是否有新增repo 成功

[clone]
去自己的GitHub 建立新的repo 並且選擇LICENSE & README.md --> copy http link --> cd Desktop --> git clone [repo http link] --> 新的repo 就會出現在local Desktop --> upload the local project to Github

-----------------------------------------------
Basic 
//1 
let Pi = 3.1415
必須設定為常數, 屬於 Double 型別

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
myFriends.append("Michael")
print(myFriends)

//4
myFriends.swapAt(2, 0)

//5
for friends in myFriends {
    print(friends, terminator: " ")
}

//6 index 5 out of range 所以會出現error

//7
let firstElement = myFriends[0]
print(firstElement)

//8
if let lastElement = myFriends.last{
    print(lastElement)
}

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
myCountryNumber["GB"] = nil
print (myCountryNumber)

-------------------------------------------
ControlFlow 
//1
let lottoNumbers = [10, 9, 8, 7, 6, 5]
for i in 3...5 {
    print (lottoNumbers[i])
}

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

//3
let lottoNum1 :[Int] = lottoNumbers.reversed()
for i in 0..<lottoNum1.count{
    print(lottoNum1[i])
}

var i = 0
while  i < lottoNumbers.count-1  {
    if (lottoNumbers[i]%2 == 0){
        print(lottoNumbers[i])
    }
    i += 1
    }

//4
let lottoNum2 :[Int] = lottoNumbers.reversed()
for i in 0..<lottoNum2.count{
    print(lottoNum2[i])
}

var j = 0
repeat {
    if (lottoNumbers[j]%2 == 0){
        print (lottoNumbers[j])
    }
    j += 1
    
} while j<lottoNumbers.count-1

//5 repeat while 會先執行程式在檢查條件, while 則是先檢查條件在執行程式

//6
var isRaining: Bool = true
if isRaining  { 
    print("It’s raining, I don’t want to work today.")}
    else{
    print ("Although it’s sunny, I still don’t want to work today.")
}

//7
let jobLevel : [Int] = [1,2,3,4]

for number in 0...jobLevel.count {
    switch number{
    case jobLevel[0] :
        print ("Member") 
    case jobLevel[1] :
        print ("Team Leader")
    case jobLevel[2]: 
        print ("Manager")
    case jobLevel[3] :
        print ("director")
        
    default:
        print ("We don't have this job")
        
    }
---------------------------------------------
Function
//1
func greet (person name : String) -> String {
    return "Hello, \(name)"
}
greet(person:"Luke")

//2
func multiply(a :Int , b :Int = 10){
    print (a*b)
}
multiply(a: 2)


//3 argument label 是在呼叫function 時候的外部參數, parameter name 是寫在function內的參數 "
    
//4 第一個顯示的type是字串，第二個顯示的type是數字
