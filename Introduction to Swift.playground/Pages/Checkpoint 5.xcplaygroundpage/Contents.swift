//: [Previous](@previous)

import Foundation

/// CHECKPOINT 5
/// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-5
/// Your job is to:
/// Filter out any numbers that are even
/// Sort the array in ascending order
/// Map them to strings in the format “7 is a lucky number”
/// Print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

/// You’ve already met `sorted()`, `filter()`, `map()`,
/// so I’d like you to put them together in a chain
/// — call one, then the other, then the other back to back
/// without using temporary variables.

luckyNumbers.filter({ $0 % 2 == 1 }).sorted().map {
    print("\($0) is a lucky number")
}


luckyNumbers.filter {
    $0 % 2 == 1
}.sorted().map {
    print("\($0) is a lucky number")
}



//: [Next](@next)
