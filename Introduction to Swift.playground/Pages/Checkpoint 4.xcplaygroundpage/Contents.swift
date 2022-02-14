//: [Previous](@previous)

import Foundation
import Darwin

/// Write a function that accepts an integer from 1 through 10,000,
/// and returns the integer square root of that number.
/// • You can't use the built-in sart) function or similar - you need to find the square root yourself.
/// • If the number is less than 1 or greater than 10,000 you should throw an "out of bounds" error.
/// • You should only consider integer square roots.
/// • If you can't find the square root, throw a "no.root" error.
/// HINTS;
/// This is a problem you should “brute force” – create a loop with multiplications inside, looking for the integer you were passed in.
/// The square root of 10,000 – the largest number I want you to handle – is 100, so your loop should stop there.
/// If you reach the end of your loop without finding a match, throw the “no root” error.
/// You can define different out of bounds errors for “less than 1” and “greater than 10,000” if you want, but it’s not really necessary – just having one is fine.

enum SquareRootError: Error {
    case outOfBounds, noRoot
}


func calculateSquareRoot(of number: Int) throws
-> Int {
    
    if number == 0 || number > 100 { throw SquareRootError.outOfBounds }
    if Double(number).squareRoot().truncatingRemainder(dividingBy: 1) != 0.00 { throw SquareRootError.noRoot }
    
    return Int(Double(number).squareRoot())
}


let yourNumber: Int = 0

do {
    let result = try calculateSquareRoot(of: yourNumber)
    print("The square root of \(yourNumber) is \(result).")
} catch SquareRootError.outOfBounds {
    print("The number is out of bounds.")
} catch SquareRootError.noRoot {
    print("The number has no root.")
} catch let error {
    print("\(error.localizedDescription)")
}




//: [Next](@next)
