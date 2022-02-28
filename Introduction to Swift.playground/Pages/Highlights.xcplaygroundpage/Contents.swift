//: [Previous](@previous)

import Foundation



struct Timer {
    
    var totalTime: Int {
        
        willSet {
            print("The total time will be set to \(newValue).")
        }
        
        didSet {
            print("The total time was \(oldValue).")
            print("The updated total time is \(totalTime).")
        }
    }
    var elapsedTime: Int
    var timeRemaining: Int {
        
        get {
            print("\(totalTime - elapsedTime) seconds remaining.")
            return totalTime - elapsedTime
        }
        
        set {
            print("Updating the total Time to \(newValue)")
            totalTime = newValue
        }
    }
}


var timer = Timer.init(totalTime: 100,
                       elapsedTime: 10)
timer.timeRemaining
/// You can reset the `totalTime` using the `set` variant of the computed property:
timer.timeRemaining = 200
timer.totalTime // 200
timer.timeRemaining // 190

//: [Next](@next)
