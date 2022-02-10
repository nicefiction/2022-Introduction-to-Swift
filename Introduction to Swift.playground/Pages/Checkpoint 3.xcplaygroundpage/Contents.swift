//: [Previous](@previous)

import Foundation

/// FizzBuzz Challenge.
/// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-3

for eachNumber in 1...100 {

    if eachNumber.isMultiple(of: 3) && eachNumber.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if eachNumber.isMultiple(of: 3) {
        print("Fizz")
    } else if eachNumber.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(eachNumber)
    }
}

print("OPTION 2")

for eachNumber in 1...100 {
    
    switch (eachNumber.isMultiple(of: 3), eachNumber.isMultiple(of: 5)) {
    case (true, true): print("FizzBuzz")
    case (true, false): print("Fizz")
    case (false, true): print("Buzz")
    default: print(eachNumber)
    }
}





//: [Next](@next)
