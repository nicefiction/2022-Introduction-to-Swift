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



///How to unwrap optionals with guard
///https://www.hackingwithswift.com/quick-start/beginners/how-to-unwrap-optionals-with-guard
///https://www.hackingwithswift.com/quick-start/understanding-swift/when-to-use-guard-let-rather-than-if-let
///`guard let` is designed to exit the current function, loop, or condition if the check fails,
///so any values you unwrap using it will stay around after the check.
///Use `if let` if you just want to unwrap some optionals,
///but prefer `guard let` if you are specifically checking that conditions are correct before continuing.

func returnSquare(_ number: Int?)
-> Int? {
    
    guard let _number = number
    else { return nil }
    
    return (_number * _number)
}


returnSquare(5)


func printSquare(of number: Int?)
-> Void {
    
    guard let _number = number
    else {
        print("Please add a valid number.")
        return
    }
    
    print("\(_number) squared is \(_number * _number)")
}

printSquare(of: 6)


///TIP:
///You can use `guard` with any condition,
///including ones that _don’t_ unwrap optionals.
///For example, you might use:
func printAlbums(_ albums: [String])
-> Void {
    
    guard albums.isEmpty
    else {
        print(albums)
        return
    }
}

printAlbums(albums)


func getMeaningOfLife()
-> Int? {
    
    return 42
}


func printMeaningOfLife()
-> Void {
    
    guard let _number = getMeaningOfLife()
    else { return }
    ///`guard let` lets us focus on the “happy path”
    ///— the behavior of our function when everything has gone to plan:
    print("\(_number) is the answer to the meaning of Life.")
}

getMeaningOfLife()
printMeaningOfLife()


func double(_ number: Int?)
-> Int? {
    
    guard let _number = number
    else { return nil }
    
    return _number * 2
}


let input: Int = 8
if let _number = double(input) {
    print(_number)
}


func verify(_ age: Int?)
-> Bool {
    
    guard age != nil
    else { return false }
    
    return true
}



//: [Next](@next)
