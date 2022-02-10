//: [Previous](@previous)

import Foundation

/// How to use type annotations
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-type-annotations

var score: Double = 0


var primaryColors: [String] = [
    "Blue", "Yellow", "Red"
]

var secondaryColors: [String] = [String]()
var tertiaryColors: [String] = []
var cmykColors = [String]()


enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day: Weekday
day = Weekday.monday


var human: [String: String] = [
    
    "firstName": "Dorothy",
    "lastName": "Gale",
    "age": "17",
    "address": "Emerald City"
]


var allNumbers: Set<Int> = [
    0, 1, 2, 3, 4, 5
]

var evenNumbers = Set([2, 4, 6])
var unevenNumbers = Set<Int>()
unevenNumbers = [
    1, 3, 5
]




//: [Next](@next)
