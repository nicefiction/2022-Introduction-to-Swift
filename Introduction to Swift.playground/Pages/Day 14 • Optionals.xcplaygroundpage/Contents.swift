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

// print(optionalUsername) /// Prints `Optional("Dorothy")`

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


///How to unwrap optionals with nil coalescing
///https://www.hackingwithswift.com/quick-start/beginners/how-to-unwrap-optionals-with-nil-coalescing

let colors: [String: String] = [
    "blue": "🔵",
    "red": "🔴",
    "yellow": "🟡"
]

let green = colors["green", default: "N/A"]
let purple = colors["purple"] ?? "N/A"


struct Book {
    
    var author: String?
    var title: String
}

let book = Book(author: nil,
                title: "Hello world")

let author = book.author ?? "Anonymous"


let stringInput: String = ""
let integerConversion: Int = Int(stringInput) ?? 0


let cmykColors: [String] = [
    "Cyan", "Magenta", "Yellow", "Black"
]

let randomCMYKColor = cmykColors.randomElement() ?? "None"


///NOTE:
///You can chain nil coalescing if you want to,
///although I don’t think it is common.
///So, this kind of code is valid if you wanted it:

func first(array: [String?])
-> String? {
    
    return array[0]
}


func second(array: [String?])
-> String? {
    
    return array[0]
}


let emptyArray: [String?] = [nil]
let selectedElement = first(array: emptyArray) ?? second(array: emptyArray) ?? "N/A"



var bestPony: String? = "Pinkie"
let selectedPony: String = bestPony ?? "Snowhite"
let anotherPony: String? = bestPony ?? "Snowhite"



///How to handle multiple optionals using optional chaining
///https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-multiple-optionals-using-optional-chaining

/*
 struct Book {
     
     var author: String?
     var title: String
 }
 */

let emeraldCity: Book? = Book(author: nil,
                              title: "The Emerald City")

let firstLetterUppercased = emeraldCity?.author?.first?.uppercased() ?? "A"
///So, it reads
///“if we have a book,
///and the book has an author,
///and the author has a first letter,
///then uppercase it and send it back,
///otherwise
///send back A”.


let movieCast: [String: String] = [
    "Dorothy": "Gale",
    "Glinda": "of Oz",
    "Ozma": "of Oz"
]

let glindaSurname = movieCast["Glinda"]?.first?.uppercased() ?? "N/A"
print("Glinda: \(glindaSurname)")


let characters: [String] = [
    "Dorothy", "Ozma", "Glinda", ""
]


let characterCount = characters.last?.count


let songs: [String]? = Array<String>()
let lastSongAllCaps = songs?.last?.uppercased()

let attendees: [String] = Array<String>()
let firstAttendeeAllCaps = attendees.first?.uppercased()



///How to handle function failure with optionals
///https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-function-failure-with-optionals
///You’ll find `try?` is mainly used in three places:
///(1) In combination with `guard let` to exit the current function if the `try? `call returns `nil`.
///(2) In combination with nil coalescing to attempt something or provide a default value on failure.
///(3) When calling any throwing function without a return value,
///when you genuinely don’t care if it succeeded or not
///— maybe you are writing to a log file or sending analytics to a server, for example.

enum UserError: Error {
    case badID, networkFailed
}


func getUser(id: Int) throws
-> String {
    
    if id == 0 {
        throw UserError.badID
    } else if id < 0 {
        throw UserError.networkFailed
    } else {
        return "User with ID \(id)."
    }
}


do {
    let result = try getUser(id: 10)
    print(result)
} catch UserError.badID {
    print("Bad user ID.")
} catch UserError.networkFailed {
    print("Network failed.")
} catch let error {
    print(error.localizedDescription)
}

///When should you use optional `try?`
/// If you want to run a function and care only that it succeeds or fails
/// – you don’t need to distinguish between the various reasons why it might fail –
/// then using optional `try?` is a great fit,
/// because you can boil the whole thing down to _“did it work?”_

if let _result = try? getUser(id: 12) {
    print("User: \(_result)")
}

let result = (try? getUser(id: 23)) ?? "Anonymous"
print("User 2: \(result)")



//: [Next](@next)
