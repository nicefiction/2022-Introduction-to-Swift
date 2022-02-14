//: [Previous](@previous)

import Foundation

/// How to provide default values for parameters
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-provide-default-values-for-parameters

func printTable(of tableNumber: Int,
                upto endNumber: Int = 10) {
    
    for eachNumber in 0...endNumber {
        
        print("\(eachNumber) * \(tableNumber) = \(eachNumber * tableNumber)")
    }
}

printTable(of: 5)
printTable(of: 2, upto: 12)


var names: [String] = [
    "Dorothy", "Ozma", "Glinda"
]


print("Total names: \(names.count)")
//names.removeAll()
/// When we call `removeAll()`,
/// Swift will automatically remove all the items in the array,
/// then free up all the memory that was assigned to the array.
/// That’s usually what you’ll want,
/// because after all you’re removing the objects for a reason.
/// But sometimes – just sometimes – you might be about to add lots of new items back into the array,
/// and so there’s a second form of this function that removes the items while also keeping the previous capacity:
names.removeAll(keepingCapacity: true)
print("Total names: \(names.count)")


func findDirections(from start: String,
                    to end: String,
                    route: String = "fastest",
                    avoidHighways: Bool = true) {
    
    print("Let's go from \(start) to \(end), using the \(route) route with \(avoidHighways ? "no" : "many") highways.")
}

findDirections(from: "London", to: "Paris")
findDirections(from: "Stockholm",
               to: "Copenhafue",
               route: "slowest",
               avoidHighways: false)



/// How to handle errors in functions
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-errors-in-functions
/// STEP 1:
/// Tell Swift about the possible errors that can happen.
enum PasswordError: Error {
    case obvious, tooShort
}

/// STEP 2:
/// Write a function that can flag up errors IF they happen.
func check(password: String) throws
-> String {
    
//    if password.count == 5 { throw PasswordError.tooShort}
//    if password == "12345" { throw PasswordError.obvious}
//
//    if password.count < 8 {
//        return "Your password is OK."
//    } else if password.count < 10 {
//        return "Your password is good."
//    } else {
//        return "Your password is excellent."
//    }
/// OR use this instead:
    switch (password.count, password) {
    case (_, "12345"): throw PasswordError.obvious
    case (0...5, _): throw PasswordError.tooShort
    case (6...8, _): return "Your password is OK."
    case (9...10, _): return "Your password is good."
    default: return "Your password is excellent."
    }
}


/// STEP 3:
/// Call that function, and handle any errors that might happen.
let myPassword: String = "12354"

do {
    let result = try check(password: myPassword)
    print("Password rating: \(result)")
} catch PasswordError.obvious {
    print("Your password is too obvious.")
} catch PasswordError.tooShort {
    print("Your password is too short.")
} catch let error {
    print("\(error.localizedDescription)")
}


/// When should you write throwing functions?
/// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-write-throwing-functions
/// When you are writing your code,
/// chances are you’ll think to yourself
///  “Should this function `throw` any errors it encounters,
///  or should it maybe handle them itself?”
///  This is really common, and to be honest there is no single answer
///  (`A`) you can handle the errors inside the function
///  (thus making it not a throwing function),
///  (`B`) you can send them all back to whatever called the function
///  (called `error propagation` or sometimes “bubbling up errors”),
///  and (`A + B`) you can even handle some errors in the function and send some back.
///  All of those are valid solutions, and you will use all of them at some point.





//: [Next](@next)
