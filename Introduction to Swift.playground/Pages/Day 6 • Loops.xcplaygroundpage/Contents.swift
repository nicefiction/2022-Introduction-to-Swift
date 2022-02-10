//: [Previous](@previous)

import Foundation

/// How to use a for loop to repeat work.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-a-for-loop-to-repeat-work

let platforms: [String] = [
    "iOS", "macOS", "watchOS", "iPadOS"
]

for eachPlatform in platforms {
    print("SwiftUI works great in \(eachPlatform).")
}



/// NESTED LOOPS:
for eachNumber in 0...5 {
    print("Number \(eachNumber)")
}

for eachTableNumber in 1...10 {
    print("Printing the table of \(eachTableNumber).")
    
    for eachNumber in 0...10 {
        print("\(eachNumber) * \(eachTableNumber) = \(eachNumber * eachTableNumber)")
    }
    
    print()
}



/// RANGES:
/// https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-two-range-operators
/// For 1 THROUGH 5:
for eachNumber in 1...5 {
    print("From \(eachNumber) through 5.")
}

/// For 1 UPTO 5:
for eachNumber in 1..<5 {
    print("From \(eachNumber) up to 5.")
}


let names: [String] = [
    "Dorothy", "Ozma", "Glinda"
]

/// Ranges are also helpful for reading groups of items from arrays:
print(names[1...2])
/// One-sided range to say: "Give me 1 to the end of the array.",
print(names[0...]) // ["Dorothy", "Ozma", "Glinda"]



var taylorSwiftLyrics: String = "Haters gonna"

for _ in 1...4 {
    taylorSwiftLyrics += " hate"
}

print("\(taylorSwiftLyrics)!")


for eachName in ["Dorothy", "Ozma", "Glinda"] {
    print("Name: \(eachName)")
}


let colors: [String] = [
    "Blue", "Yellow", "Red"
]

for _ in colors {
    print("Secret color")
}




/// How to use a while loop to repeat work.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-a-while-loop-to-repeat-work
/// `for` loops are generally used with finite sequences.
/// `while` loops can loop until any arbitrary condition becomes `false`.
/// This means we can repeat the same code until…
/// …the user asks us to stop,
/// …a server tells us to stop,
/// …we have found the answer we are looking for,
/// …we have generated enough data.

var number: Int = 5

while number > 0 {
    print("Number: \(number)")
    number -= 1
}

print("The number is \(number).")


var rollNumber: Int = 0
var rollCount: Int = 0


while rollNumber != 20 {
    
    rollNumber = Int.random(in: 0...20) /// Use `Double.random` with Double values.
    rollCount += 1
    print("Roll \(rollCount): The current role is \(rollNumber).")
}



/// How to skip loop items with break and continue.
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-skip-loop-items-with-break-and-continue
/// Use `continue` when you want to skip the rest of the current loop iteration,
/// and use `break` when you want to skip all remaining loop iterations.
/// https://www.hackingwithswift.com/quick-start/understanding-swift/why-would-you-want-to-exit-a-loop

var files: [String] = [
    "a.jpeg", "b.text", "c.jpeg", "d.jpeg"
]


for eachFile in files {
    if eachFile.hasSuffix(".jpeg") == false {
        continue
    }
    
    print(eachFile)
}


let divider1: Int = 14
let divider2: Int = 4
var results = Array<Int>()

for eachNumber in 1...100_000 {
    
    // if eachNumber % divider1 == 0 && eachNumber % divider2 == 0 {
    if eachNumber.isMultiple(of: divider1) && eachNumber.isMultiple(of: divider2) {
        results.append(eachNumber)
        
        if results.count == 10 {
            break
        }
    }
}

print(results)



var scores: [Int] = [
    5, 7, 3, 1, 0, 9, 8, 6
]
var count = 0

/// A loop with a labeled statement:
// scoreLoop: for eachScore in scores {
for eachScore in scores {
    if eachScore == 0 {
        break
    }
    
    count += 1
}

print("You had \(count) scores before you got a 0 score.")
/// Without `break` we’d need to continue looping through scores even after we found the first 0,
/// which is wasteful.

//: [Next](@next)
