//: [Previous](@previous)

import Foundation

/// `Checkpoint 2`
/// Create an Array of Strings,
/// then write some code that prints the number of items in the Array
/// and also the number of Unique items in the Array:
/// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-2


let colors: [String] = [
    "blue", "red", "yellow", "green", "blue", "yellow", "yellow"
]

print("The total number of items in the Array is \(colors.count).")

print("The total of unique items in the Array is \(Set(colors).count).")








//: [Next](@next)
