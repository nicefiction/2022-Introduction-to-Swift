//: [Previous](@previous)

import Foundation

///Classes
///https://www.hackingwithswift.com/100/swiftui/12



///How to create your own classes
///https://www.hackingwithswift.com/quick-start/beginners/how-to-create-your-own-classes

///How to make one class inherit from another
///https://www.hackingwithswift.com/quick-start/beginners/how-to-make-one-class-inherit-from-another

class Employee {
    
    var hours: Int
    
    init(hours: Int) {
        
        self.hours = hours
    }
    
    
    func work()
    -> Void {
        
        print("I work \(hours) hours a day.")
    }
}


final class Developer: Employee {
    
    override func work()
    -> Void {
        
        print("As a developer I work \(hours) hours a day.")
    }
}


final class Manager: Employee {
    
    override func work()
    -> Void {
        
        print("As a manager I am attending meetings for \(hours) a day.")
    }
}


let dorothy = Developer(hours: 8)
let ozma = Manager(hours: 10)

dorothy.work()
ozma.work()



///How to add initializers for classes
///https://www.hackingwithswift.com/quick-start/beginners/how-to-add-initializers-for-classes

class Vehicle {
    
    var isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}


class Auto: Vehicle {
    
    // var isConvertible: Bool = false
    var isConvertible: Bool
    
    
    init(isElectric: Bool,
         isConvertible: Bool) {
        
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}


//let auto = Auto.init(isElectric: true)
//auto.isConvertible = true

let auto = Auto.init(isElectric: true,
                     isConvertible: true)


class Instrument {
    
    var name: String
    
    
    init(name: String) {
        
        self.name = name
    }
}


class Piano: Instrument {
    
    var hasKeys: Bool
    
    init(hasKeys: Bool) {
        self.hasKeys = hasKeys
        super.init(name: "Piano")
    }
}



//: [Next](@next)
