let getresult :(Int) -> Bool = {
    (num: Int) -> Bool in
    if num%2 != 0 {
        return true
    }else{
        return false
    }
}

getresult(3)
getresult(4)

