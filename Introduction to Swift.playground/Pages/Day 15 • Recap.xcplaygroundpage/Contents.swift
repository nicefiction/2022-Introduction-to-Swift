//: [Previous](@previous)

import Foundation

let (name, age) = ("Dorothy", 17)
/// This doesn't work:
// let (name: String, age: Int) = ("Dorothy", 17)
print(name)

var setCollection: Set<Int> = Set([1, 2, 3, 4, 5])
var arrayCollection: Array<Int> = [1, 2, 3, 4, 5]
var dictionaryCollection: Dictionary<String, Int> = [
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5
]

var emptySet = Set<Int>()
var emptyArray = Array<Int>()
var emptyDictionary = Dictionary<String, Int>()




//: [Next](@next)
