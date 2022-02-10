//: [Previous](@previous)

import Foundation

/// How to check a condition is true or false.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-check-a-condition-is-true-or-false

let dorothy: String = "Dorothy"
let ozma: String = "Ozma"

if dorothy < ozma {
    print("Hello \(ozma).")
}


if dorothy > ozma {
    print("Hello \(dorothy).")
}



var username: String = "dorothy123"

if username != "" {
    print("Username: \(username)")
}


// if username == "" {
// if username.count == 0 {
// if username.isEmpty == true {
if username.isEmpty { // This is the most efficient option to write Swift.
    username = "anonymous"
}

print("Welcome \(username)!")



var numbers: [Int] = [
    1, 2, 3
]

numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print("Numbers: \(numbers)")



let age: Int = 18

if age >= 18 {
    print("You can vote.")
}




/// We can even ask Swift to make our enums comparable, like this:
/// https://www.hackingwithswift.com/quick-start/understanding-swift/how-does-swift-let-us-compare-many-types-of-data


enum Weekday: Comparable {
    case monday, tuesday, wednesday, thursday, friday
}

print(Weekday.monday < Weekday.tuesday) // true
/// That will print “true”, because small comes before large in the enum case list.




/// How to check multiple conditions.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-check-multiple-conditions

let agecheck: Int = 16

if agecheck >= 18 {
    print("You can vote.")
} else {
    print("You are too young to vote.")
}


let a: Bool = true
let b: Bool = false

if a {
    print("Option a is true.")
} else if b {
    print("Option b is true.")
} else {
    print("Option a and b are both false.")
}



let temperature: Int = 20


if temperature > 10 {
    if temperature < 30 {
        print("It is a nice day.")
    }
}


if temperature > 10 && temperature < 30 {
    print("It is another nice day.")
}



let userAge: Int = 14
let hasParentalConsent: Bool = true

// if userAge >= 16 || hasParentalConsent == true {
if userAge >= 16 || hasParentalConsent {
    print("You can buy the game.")
}




enum TransportationOption {
    case eBike, eScooter, bike, car, train
}

let transport: TransportationOption = .eBike

if transport == .eBike || transport == .eScooter || transport == .bike {
    print("You can use the bike lane.")
} else if transport == .car {
    print("There is a traffic jam.")
} else {
    print("Let's go by train.")
}



/// What’s the difference between if and else if?
/// https://www.hackingwithswift.com/quick-start/understanding-swift/whats-the-difference-between-if-and-else-if

let dragonScore: Int = 9_004

if dragonScore > 9_000 { // Swift will check score only once.
    print("You score is over 9_000.")
} else if dragonScore == 9_000 {
    print("You score is exactly 9_000.")
} else {
    print("You score is not over 9_000.")
}



/// How to check multiple conditions.
/// https://www.hackingwithswift.com/quick-start/understanding-swift/how-to-check-multiple-conditions

let isOwner: Bool = true
let isAdmin: Bool = false
let isEditingEnabled: Bool = true


if (isOwner && isEditingEnabled) || isAdmin {
    print("You can delete your message.")
}
/// TIP:
/// Any time you mix `&&` and `||` in a single condition
/// you should almost certainly use parentheses to make the result clear.




/// How to use switch statements to check multiple conditions.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-switch-statements-to-check-multiple-conditions
/// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-switch-statements-rather-than-if


enum Weather {
    case sunny, windy, rainy, snowy, unknown
}

let forecast: Weather = .sunny

switch forecast {
case .sunny: print("Wear a t-shirt.")
case .windy: print("Wear a jumper.")
case .rainy: print("Take an umbrella with you.")
case .snowy: print("Wear a Winter coat.")
case .unknown: print("Stay home")
}


let song: String = "Do"

switch song {
case "Do":
    print("Do")
    fallthrough
case "Re":
    print("Re")
    fallthrough
default:
    print("Mi")
}



/// How to use the ternary conditional operator for quick tests.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-the-ternary-conditional-operator-for-quick-tests
/// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-the-ternary-operator-in-swift

let isAuthenticated: Bool = true

print(isAuthenticated ? "Success" : "Failure")



let votingAge: Int = 18

print(votingAge >= 18 ? "Can vote" : "Cannot vote")


let hour = 23

print(hour < 12 ? "It is before noon." : "It is after noon.")


let names: [String] = [
    "Dororthy", "Ozma", "Glinda"
]

let characterCount: String = names.isEmpty ? "No one" : "\(names.count) people"
print(characterCount)


enum Theme {
    case light, dark
}

let theme: Theme = .dark

let background = (theme == .dark) ? "Black" : "White"
print("Background color: \(background)")


//: [Next](@next)
