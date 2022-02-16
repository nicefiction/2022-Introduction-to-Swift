//: [Previous](@previous)

import Foundation

/// How to create and use closures.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-closures

func greetUser() {
    print("Hello there.")
}


var greetHuman: () -> Void = greetUser
/// IMPORTANT:
/// When you are copying a function,
/// you don’t write the parentheses after it — it is `var greetHuman = greetUser`
/// and NOT `var greetHuman = greetUser()`.
/// If you put the parentheses there
/// you are _calling the function_
/// and assigning its return value back to something else.
greetHuman()
/// But what if you wanted to skip creating a separate function,
/// and just assign the functionality directly to a constant or variable?
/// You can do this with a CLOSURE EXPRESSION:
let greetPerson = { (name: String) -> String in
    "Hello \(name)."
}

greetPerson("Dorothy")


/// The names of the data it receives
/// are not part of the function’s type:

func getUserData(for id: Int) -> String {
    
    return id == 1_939 ? "Dorothy" : "Anonymous"
}


let userData: (Int) -> String = getUserData

let person = userData(1_939)
/// NOTE:
/// The copy is called using `userData(1_939)`
/// rather than`userData(1_939)`.
/// So, again:
/// external parameter names only matter
/// when we are _calling a function directly_,
/// not when we create a closure
/// or when we take a copy of the function first.
print(person)


var cmykColors: [String] = [
    "magenta", "yellow", "black", "cyan"
]


var sortedCMYKColors = cmykColors.sorted()
print(sortedCMYKColors)


func customSortUsing(color1: String,
                     color2: String)
-> Bool {
    
    if color1 == "yellow" {
        return true
    } else if color2 == "yellow" {
        return false
    }
    
    return color1 < color2
}


sortedCMYKColors = cmykColors.sorted(by: customSortUsing)
print(sortedCMYKColors)

/// Rather than passing in a function,
/// we are passing a closure:
sortedCMYKColors = cmykColors.sorted { (color1: String, color2: String) -> Bool in
    
    if color1 == "yellow" {
        return true
    } else if color2 == "yellow" {
        return false
    }
    
    return color1 < color2
}

print(sortedCMYKColors)


let helloWorld = { () -> String in
    return "Hello 👋 World 🌎"
}

print(helloWorld())



/// How to use trailing closures and shorthand syntax
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-trailing-closures-and-shorthand-syntax

sortedCMYKColors = cmykColors.sorted { (color1: String, color2: String) -> Bool in
    
    if color1 == "yellow" {
        return true
    } else if color2 == "yellow" {
        return false
    }
    
    return color1 < color2
}


sortedCMYKColors = cmykColors.sorted { (color1, color2) in
    
    if color1 == "yellow" {
        return true
    } else if color2 == "yellow" {
        return false
    }
    
    return color1 < color2
}


sortedCMYKColors = cmykColors.sorted {
    
    if $0 == "yellow" {
        return true
    } else if $1 == "yellow" {
        return false
    }
    
    return $0 < $1
}


var reverseCMYKColors = cmykColors.sorted { (color1: String, color2: String) -> Bool in
    
    return color1 > color2
}


reverseCMYKColors = cmykColors.sorted { (color1, color2) in
    
    return color1 > color2
}


reverseCMYKColors = cmykColors.sorted { color1, color2 in
    
    return color1 > color2
}


reverseCMYKColors = cmykColors.sorted { $0 > $1 }
print("CMYK colors reversed: \(reverseCMYKColors)")

sortedCMYKColors = cmykColors.sorted()
print("CMYK colors: \(sortedCMYKColors)")


cmykColors += ["yellow", "yellow"]
print("Updated CMYK colors array: \(cmykColors)")
/// The `filter()` function lets us run some code on every item in the array,
/// and will send back a new array containing every item that returns true for the function.
let yellowsOnly = cmykColors.filter { $0.hasPrefix("y") }
print("Yellow only: \(yellowsOnly)")


/// The `map()` function lets us transform every item in the array using some code of our choosing,
/// and sends back a new array of all the transformed items:
let colorsAllcaps = cmykColors.map { $0.uppercased() }
print("Color names in all caps: \(colorsAllcaps)")
/// TIP:
/// When working with `map()`,
/// the type you return doesn’t have to be the same as the type you started with
/// — you could convert an array of `Int` to an array of `String`.



/// OPTIONAL
/// Why does Swift have trailing closure syntax?
/// https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-trailing-closure-syntax

func animate(duration: Double,
             animations: () -> Void) {
    
    print("Starting an animation for a duration of \(duration) seconds.")
    animations()
}

/// Call the function:
animate(duration: 5.00,
        animations: {
    
    print("3")
    print("2")
    print("1")
    print("Fade in the image.")
})
/// Or, with Trailing Closure syntax:
animate(duration: 3.00) {
    
    print("3")
    print("2")
    print("1")
    print("Fade in the image.")
}
/// Trailing closures work best when their meaning is directly attached to the name of the function
/// — you can see what the closure is doing because the function is called `animate()`.
//: [Next](@next)
