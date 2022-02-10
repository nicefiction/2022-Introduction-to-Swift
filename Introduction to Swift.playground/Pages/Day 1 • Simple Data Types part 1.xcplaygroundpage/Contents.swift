//: [Previous](@previous)

import Foundation
import CoreGraphics

var greeting = "Hello, playground"

/// Simple Data Types: Part 1


/// 1.4 How to create variables and constants:
///  https://www.hackingwithswift.com/quick-start/beginners/how-to-create-variables-and-constants


let firstName: String = "Dorothy"

let lastName: String = "Gale"

print("hello", firstName, lastName)



/// 1.5 How to create a String
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-strings

let fileName: String = "dorothy.jpg"

fileName.hasSuffix(".jpg") // true

firstName.hasPrefix("D") // true
firstName.hasPrefix("y") // false


let quote = "She said: \"hello\""
print(quote)

let multiLineString: String = """
Blue,
Yellow,
and Green.
"""
print(multiLineString)
multiLineString.count

print(fileName.uppercased())



/// 1.6 How to store whole numbers
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-store-whole-numbers

var score = 10
let reallyBigNumber: Int = 10_000_000_000

let halvedScore = score/2
let highScore = score + 10
let squaredScore = score + score

score = score + 2
score += 2
print(score)

score.isMultiple(of: 7) // true
120.isMultiple(of: 3) // true



/// 1.6 How to store decimal numbers
///  https://www.hackingwithswift.com/quick-start/beginners/how-to-store-decimal-numbers

let a: Float = 0.1
let b: Float = 0.2
let sum = a + b
print(sum)

let c = 0.1
let d = 0.2
print(c + d)
/// GOTCHA:
/// In Swift decimal numbers are called `Double`, short for double-length floating-point number.
/// That means they can hold very large numbers if needed,
/// but they also aren’t 100% accurate
/// – you shouldn’t use them when 100% precision is required,
/// such as when dealing with money.

// Type Safety:
print(Double(a) + d)

let e: CGFloat = 0.2
print(c + e)
/// Swift lets us use regular `Double` numbers everywhere a `CGFloat` is expected,
/// so although you will see `CGFloat` appear from time to time you can just ignore it.
/// OLIVIER: It doesn't work with `Float`:
// print(a + e) // ERROR



//: [Next](@next)
