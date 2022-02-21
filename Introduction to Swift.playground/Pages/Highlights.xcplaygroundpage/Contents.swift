//: [Previous](@previous)

import Foundation



struct Timer {
    
    var totalTime: Int
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
