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



///How to copy classes
///https://www.hackingwithswift.com/quick-start/beginners/how-to-copy-classes

// struct User {
class User {
    
    var username: String = "Anonymous"
    
    
    func copy()
    -> User {
        
        return User()
    }
}


let user1 = User()
var user2 = user1
user2.username = "Glinda"
/// Creates a _deep copy_ from `user1`:
var user3 = user1.copy()
user3.username = "Ozma"
print(user1.username, user2.username, user3.username, separator: ", ")



///How to create a deinitializer for a class
///https://www.hackingwithswift.com/quick-start/beginners/how-to-create-a-deinitializer-for-a-class

class Human {
    
    let id: Int
    
    
    init(id: Int) {
        self.id = id
        print("Creating an instance of Human with ID \(id).")
    }
    
    deinit {
        print("Deleting the instance of Human with ID \(id).")
    }
}


//var human = Human(name: "Dorothy")

var humans = Array<Human>()


for eachNumber in 1...3 {
    let human = Human(id: eachNumber)
    print("Human with ID \(human.id) created")
    humans.append(human)
}

humans.removeAll()



//: [Next](@next)
