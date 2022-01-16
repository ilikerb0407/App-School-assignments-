
struct Wizard {
    var firstName : String{
        willSet{
            print(firstName + " will be set to " + newValue)
        }
        didSet{
            if firstName.contains(" "){
                print("No spaces allowe ! \(firstName) is not a first name. Reverting to \(oldValue)" )
                firstName = oldValue
            }
        }
    }
    var lastName : String
}
var wizard = Wizard (firstName: "ifojio", lastName: "ijojio")
wizard.firstName = "oiojio"
wizard.lastName = "hygujiojojio"
wizard.firstName = "iiojio jiojioio"
    // 


