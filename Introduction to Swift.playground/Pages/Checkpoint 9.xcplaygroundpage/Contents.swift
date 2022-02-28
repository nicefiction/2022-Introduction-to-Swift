//: [Previous](@previous)

import Foundation

/**
 Checkpoint 9
 • Write a function that accepts an optional array of integers,
 and returns one of those integers randomly.
 • If the array is missing or empty,
 return a new random number in the range 1 through 100.
 • Write your function in a single line of code.
 */
///OPTION 1:
func chooseRandomNumber(from numbers: [Int]?)
-> Int {
    
//    guard let _numbers = numbers
//    else { return Int.random(in: 1...100) }
//
//    return !_numbers.isEmpty ? _numbers[Int.random(in: 0..<_numbers.count)] : Int.random(in: 1...100)
    
    guard let _number = numbers?.randomElement()
    else { return Int.random(in: 1...100) }
    
    return _number
}


chooseRandomNumber(from: [])
chooseRandomNumber(from: [9, 8, 7, 6, 5, 4, 3, 2])


///OPTION 2:
func chooseAnotherRandomNumber(from numbers: [Int]?) throws
-> Int {
    
    if let _numbers = numbers {
        return !_numbers.isEmpty ? _numbers[Int.random(in: 0..<_numbers.count)] : Int.random(in: 0...100)
    }
    
    return Int.random(in: 0...100)
}


try? chooseAnotherRandomNumber(from: [])


///OPTION 3:
func randomNumberFrom(_ numbers: [Int]?) throws
-> Int {
    
    guard let _number = numbers?.randomElement()
    else { return Int.random(in: 0...100) }
    
    return _number
}

try? randomNumberFrom([77, 66, 55, 44, 33, 22, 11])
try? randomNumberFrom(nil)


///OPTION 4:
func anotherRandomNumberFrom(_ numbers: [Int]?) throws
-> Int {
    
    return (numbers?.randomElement()) ?? Int.random(in: 0...100)
}

try? anotherRandomNumberFrom([])




//: [Next](@next)

