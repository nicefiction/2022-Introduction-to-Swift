//: [Previous](@previous)

import Foundation

/// How to handle missing data with optionals
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-missing-data-with-optionals

var opposites: [String: String] = [
    "open": "closed",
    "light": "dark",
]


opposites["round"]

if let _round = opposites["light"] {
    print("Printed if let: \(_round)")
} else {
    print("Unknown Key.")
}


var username: String? = "Dorothy"

if let _username = username {
    print("The unwrapped username is \(_username).")
} else {
    print("Please enter your username.")
}


func square(_ number: Int)
-> Int {
    
    return number * number
}


let number: Int? = nil


if let _number = number {
    square(_number)
} else {
    print("Please enter a valid number.")
}


func getUsername()
-> String? {
    
    return "Dorothy"
}

let optionalUsername = getUsername()

print(optionalUsername) /// Prints `Optional("Dorothy")`

if let _optionalUsername = optionalUsername {
    print("Unwrapped optional username: \(_optionalUsername).")
} else {
    print("Please enter an optional username.")
}
/// Prints `Unwrapped optional username: Dorothy.`



let album: String = "Red"
let albums: [String] = [
    "Blue", "Red", "Yellow"
]

if let _albumIndex = albums.firstIndex(of: album) {
    print("Album \(albums[_albumIndex]) is in the albums Array.")
}

//: [Next](@next)
