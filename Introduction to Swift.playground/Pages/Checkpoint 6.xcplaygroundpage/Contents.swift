//: [Previous](@previous)

import Foundation

/**
 Checkpoint 6
 • Create a struct to store information about a car. Include:
 • Its model
 • Number of seats
 • Current gear
 • Add a method to change gears up or down.
 • Have a think about variables and access control.
 • Don't allow invalid gears - 1...10 seems a fair maximum range
 */
struct Car {
    
    private(set) var currentGear: Int = 1
    let make: String
    var numberOfGears: Int
    let numberOfSeats: Int
    var maxGears: Int {
        
        return (numberOfGears > 0 && numberOfGears < 8) ? numberOfGears : 7
    }
    
    
    mutating func changeGearUp() {
        
        if currentGear > 0 && currentGear < maxGears {
            currentGear += 1
        } else {
            currentGear += 0
        }
    }
    
    
    mutating func changeGearDown() {
        
        if currentGear > 1 && currentGear < maxGears {
            currentGear -= 1
        } else {
            currentGear -= 0
        }
    }
}



print("Hello World")

var porsche = Car.init(currentGear: 1,
                       make: "Porsche",
                       numberOfGears: 15,
                       numberOfSeats: 4)
porsche.changeGearUp()
print(porsche.currentGear)
print("Hello Again")
porsche.changeGearDown()
print(porsche.currentGear)
porsche.changeGearDown()
print(porsche.currentGear)


//: [Next](@next)
