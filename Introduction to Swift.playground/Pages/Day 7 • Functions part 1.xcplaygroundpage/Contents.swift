//: [Previous](@previous)

import Foundation

/// How to reuse code with functions
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-reuse-code-with-functions

func showWelcome() {
    
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}


showWelcome() /// The function’s call site.


func printTimesTable(of number: Int,
                     upto endNumber: Int) { /// PARAMETERS
    
    for eachNumber in 1...endNumber {
        print("\(eachNumber) * \(number) = \(eachNumber * number)")
    }
}


printTimesTable(of: 5, upto: 10) /// ARGUMENTS


/// Swift lets us build new functions out of existing functions,
/// which is a technique called `function composition`.
/// By splitting your work into multiple small functions,
/// `function composition` lets us build big functions
/// by combining those small functions in various ways, a bit like Lego bricks.



/// How to return values from functions.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-return-values-from-functions

func compare(_ a: String,
             with b: String)
-> Bool {
    
    return a.sorted() == b.sorted()
}


compare("Dorothy", with: "Ozma") // false



func calculateTriangle(with a: Double,
                       and b: Double)
-> Double {
    
    // return ((a * a) + (b * b)).squareRoot()
    return sqrt((a * a) + (b * b))
}


calculateTriangle(with: 3, and: 4)



/// NOTE
/// if your function doesn’t return a value,
/// you can still use `return` by itself to force the function to exit early:

func helloWorld() { return }


helloWorld()



/// How to return multiple values from functions.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-return-multiple-values-from-functions

func isAllCaps(_ word: String)
-> Bool {
    
    return word.uppercased() == word
}


isAllCaps("DOROTHY")



func getUserFromArray()
-> [String] {
    
    return ["Dorothy", "Gale"]
}

let dorothy = getUserFromArray()
dorothy[0]
dorothy[1]
/// it is hard to remember what `dorothy[0]` and `dorothy[1]` are.


func getUserFromDictionary()
-> [String: String] {
    
    return ["firstname": "Dorothy", "lastname": "Gale"]
}

let anotherDorothy = getUserFromDictionary()
let firstnameFromDictionary = anotherDorothy["firstname", default: "Anonymous"]
let lastnameFromDictionary = anotherDorothy["lastname", default: "Anonymous"]
/// Even though we know both `firstname` and `lastname` will exist,
/// we still need to provide default values just in case things aren’t what we expect.
/// Both of these solutions — with arrays and dictionaries— are pretty bad,
/// but Swift has a solution in the form of tuples.


func getUserFromTupleWithLabels()
-> (firstname: String, lastname: String) {
    
    return (firstname: "Dorothy", lastname: "Gale")
    // return ("Dorothy", "Gale")
    /// If you are returning a tuple from a function,
    /// Swift already knows the names you are giving each item in the tuple,
    /// so you don’t need to repeat them when using `return`.
}


func getUserFromTuple()
-> (String, String) {
    
    return ("Dorothy", "Gale")
}


let dorothyFromTuple = getUserFromTuple()
let firstnameFromTuple = dorothyFromTuple.0

let dorothyFromTupleWithLabels = getUserFromTupleWithLabels()
let firstnameFromTupleWithLabels = dorothyFromTupleWithLabels.firstname
/// Rather than assigning the tuple to user,
/// then copying individual values out of there,
/// we can skip the first step
/// — we can pull apart the `return` value from `getUserFromTupleWithLabels()`
/// into two separate constants, like this:
let (firstname, lastname) = getUserFromTupleWithLabels()
print("Firstname: \(firstname), Lastname: \(lastname)")
/// if you don’t need all the values from the tuple
/// you can go a step further by using `_`
/// to tell Swift to ignore that part of the tuple:
let (firstnameOnly, _) = getUserFromTupleWithLabels()
print("Hello \(firstnameOnly)!")



/// How to customize parameter labels.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-customize-parameter-labels

let lyric: String = "I see a red door and I want it painted black."
lyric.hasPrefix("I see") // true



func printMultiplicationTable(of number: Int,
                              upto maxNumber: Int) {
    
    for eachNumber in 0...maxNumber {
        
        print("\(eachNumber) * \(number) = \(eachNumber * number)")
    }
}


printMultiplicationTable(of: 5, upto: 10)
/// `of` and `upto` are the EXTERNAL ARGUMENT names.
/// `number` and `maxNumber` are the INTERNAL PARAMETER names.


//func formatLength(length length: Int) {
//
//    print(length)
//}

//: [Next](@next)
