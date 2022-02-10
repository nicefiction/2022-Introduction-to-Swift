//: [Previous](@previous)

import Foundation

/// How to store ordered data in arrays
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-store-ordered-data-in-arrays

var primaryColours = Array<String>()
primaryColours.append("Blue")
primaryColours.append("Yellow")
primaryColours.append("Red")

print(primaryColours[1])
print(primaryColours.sorted())

let coloursReversed = primaryColours.reversed()[0] /// OLIVIER: This appears not to create a new array. It keep the original array in memmory and only does the computation when asked. PAUL: When you reverse an array, Swift is very clever – it doesn’t actually do the work of rearranging all the items, but instead just remembers to itself that you want the items to be reversed.

print(coloursReversed)

var secondaryColors = [String]()
secondaryColors.append("Green")
secondaryColors.append("Purple")
secondaryColors.append("Orange")

print(secondaryColors)

var allColors = secondaryColors + primaryColours
print(allColors.count)
print("All colors sorted: \(allColors.sorted())") // That returns a new array with its items sorted in ascending order.
print("All colors: \(allColors)")

allColors.remove(at: 1)
allColors.count
allColors.removeAll()
allColors.count

secondaryColors.contains("Orange")




/// How to store and find data in dictionaries.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-store-and-find-data-in-dictionaries

var olympics = Dictionary<Int, String>()
olympics[2012] = "London"
olympics[2016] = "Rio de Janeiro"
olympics[2021] = "Tokyo"

olympics.count
olympics.removeAll()
olympics.count


var dorothy = [String: String]()
dorothy = [
    "firstName": "Dorothy",
    "age": "17",
    "address": "Emerald City"
]

let firstName = dorothy["firstName", default: "Unknown"] // OLIVIER: No longer an optional.
let age = dorothy["age"] // OLIVIER: An optional.
dorothy["address"]

print(dorothy["firstName", default: "Unknown"])




/// How to use sets for fast data lookup.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-sets-for-fast-data-lookup
/// https://www.hackingwithswift.com/quick-start/understanding-swift/why-are-sets-different-from-arrays-in-swift
/// https://www.avanderlee.com/swift/array-vs-set-differences-explained/

var primaryColors = Set<String>()
primaryColors = [
    "Blue", "Yellow", "Red"
]
primaryColors.contains("Blue")
primaryColors.count

var secondaryColours = Set(["Green", "Orange"])
secondaryColours.insert("Purple")
secondaryColours.count

// var tertiaryColors: Set<String>
var tertiaryColors: Set<String> = []
tertiaryColors.insert("Pink")
tertiaryColors.count

print("Primary colors 1: \(primaryColors)")
print("Primary colors 2: \(primaryColors)")
print("Primary colors 3: \(primaryColors)")

let sortedPrimaryColors = primaryColors.sorted() // Return a sorted Array.
print("Sorted primary colors: \(sortedPrimaryColors)")




/// How to create and use enums
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-enums
/// At their simplest an enum is simply a nice name for a value.
/// Behind the scenes, Swift can store its enum values very simply,
/// so they are much faster to create and store than something like a `String`.

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}


var day: Weekday = .monday
day = .tuesday
day = .wednesday

/// One major benefit of enums is that Swift stores them in an optimized form
/// – when we say `Weekday.monday`
/// Swift is likely to store that using a single integer such as `0`,
/// which is much more efficient to store and check than the letters `M`, `o`, `n`, `d`, `a`, `y`.





//: [Next](@next)
