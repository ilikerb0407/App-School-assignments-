
func ijiodjif( _ word1 : String , _ word2 : String = "jmekd") -> String {
    let firstName = ["ijodj", "nin", "niij","nij"].randomElement()!
    let lastName = ["foek","kokef","mok","kio"].randomElement()!
    return firstName + word1 + word2 + lastName
}
ijiodjif("kevin") 



func generateTwitterHandle(name: String, anotherWord word : String = "Meow" ) -> String {
    name.lowercased() + word
}
generateTwitterHandle(name: "jiji")




struct Student {
    let firstName : String
    let lastName : String
    let grade : Int
}
// 先宣告學生的structure

//在宣告 classroom 
struct  Classroom {
    let subject: String
    let students : [Student]
    func getHighestGrade()-> Int? {
        //把成績用到學生的集合裡面
        var grades: [Int] = []
        for student in students {
            grades.append(student.grade)
        }
        return grades.max()
    }
    
}

let classroom = Classroom ( subject: "Math",
                           students : [
                            Student (firstName:"Wei Ju", lastName: "Huang", grade:80),
                            Student (firstName:"KaiFu", lastName:"Jhuang", grade:70),
                           Student (firstName:"uih", lastName: "jhuii", grade:90)
                           ]
)
classroom.getHighestGrade()
print (classroom.getHighestGrade())


