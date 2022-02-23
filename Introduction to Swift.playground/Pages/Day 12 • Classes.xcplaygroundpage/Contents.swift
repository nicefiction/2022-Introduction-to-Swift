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


/// How to work with variables inside classes
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-work-with-variables-inside-classes

class Runner {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


// let runner = Runner.init(name: "Dorothy")
let runner = Runner.init(name: "Dorothy")
runner.name = "Ozma"
// runner = Runner.init(name: "Glinda")
print(runner.name) // Glinda


class Pizza {
    
    private var topppings = Array<String>()
    
    
    func add(topping: String) {
        
        topppings.append(topping)
    }
}

let pizza = Pizza.init()
pizza.add(topping: "Mushrooms")



struct KinderGarten {
    
    var numberOfScreamingKids: Int = 20
    
    
    mutating func handOutIceCream() {
        
        numberOfScreamingKids = 0
    }
}


let kinderGarten = KinderGarten.init()
// kinderGarten.handOutIceCream()
/// ERROR: Cannot use mutating member on immutable value: 'kinderGarten' is a 'let' constant
/// Compare this to:

struct Code {
    
    var bugs: Int = 100
    
    
    mutating func fixBug() {
        
        bugs += 3
    }
}


var code = Code.init()
code.fixBug()


//: [Next](@next)
