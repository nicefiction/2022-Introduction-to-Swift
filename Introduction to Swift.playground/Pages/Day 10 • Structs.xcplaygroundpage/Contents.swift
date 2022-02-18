//: [Previous](@previous)

import Foundation

/// How to create your own structs
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-your-own-structs

struct Album {
    /// Properties:
    let artist: String
    let title: String
    let year: Int
    /// Methods:
    func printSummary() {
        
        print("Album: \(title) by \(artist), year: \(year)")
    }
}


let album = Album.init(artist: "Taylor Swift",
                       title: "Red",
                       year: 1989)
album.artist
album.title
album.printSummary()



struct Employee {
    
    var name: String = "Anonymous"
    var remainingVacationDays: Int
    
    
    mutating func takeVacation(days: Int) {
        
        if remainingVacationDays > days {
            remainingVacationDays -= days
            print("I am going on vacation!")
            print("Vacation days remaining: \(remainingVacationDays)")
        } else {
            print("There are not enough days remaining.")
        }
    }
}

var dorothy = Employee.init(name: "Dorothy", remainingVacationDays: 20)
dorothy.takeVacation(days: 10)
/// If you change `var dorothy` to `let dorothy`
// let dorothy = Employee.init(name: "Dorothy", remainingVacationDays: 20)
/// you’ll find Swift refuses to build your code again
/// — we are trying to call a `mutating` function on a constant struct, which isn’t allowed.
dorothy.name = "Ozma"
/// It is possible to modify the properties of a struct, but only if that struct is created as a variable.
print(dorothy.name)


var anonymous = Employee.init(remainingVacationDays: 0)



struct Customer {
    
    let id: Int
    let name: String
    
    
    init(customID: Int,
         customName: String) {

        self.id   = customID
        self.name = customName
    }
}

let customer = Customer(customID: 1,
                        customName: "Dorothy")



/// How to compute property values dynamically
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-compute-property-values-dynamically

struct Employee1 {
    
    let name: String
    var vacationRemaining: Int
}

var employee1 = Employee1(name: "Dorothy",
                          vacationRemaining: 14)

employee1.vacationRemaining -= 5
print(employee1.vacationRemaining)
employee1.vacationRemaining -= 3
print(employee1.vacationRemaining)



struct Employee2 {
    
    let name: String
    var vacationAllocated: Int = 15
    var vacationTaken: Int = 0
    var vacationRemaining: Int {
        return vacationAllocated - vacationTaken
    }
}

var employee2 = Employee2(name: "Dorothy")
employee2.vacationAllocated = 20
employee2.vacationTaken = 3
print("Remaining vacation days for employee 2: \(employee2.vacationRemaining) days.")


struct Employee3 {
    
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken: Int = 0
    var vacationRemaining: Int {
        /// Code that reads:
        get {
            return vacationAllocated - vacationTaken
        }
        /// Code that writes:
        set {
            print("New Value for vacation allocate: \(newValue)")
            return vacationAllocated = vacationTaken + newValue
        }
    }
}

var employee3 = Employee3(name: "Dorothy",
                          vacationAllocated: 10,
                          vacationTaken: 2)
employee3.vacationRemaining
/// With both a getter and setter in place,
/// we can now modify `vacationRemaining` (OLIVIER: directly:
employee3.vacationRemaining = 3

/// When should you use a computed property or a stored property?
/// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-a-computed-property-or-a-stored-property
///PERFORMANCE
///If you regularly read the property when its value hasn’t changed,
///then using a stored property will be much faster than using a computed property.
///On the other hand,
///if your property is read very rarely and perhaps not at all,
///then using a computed property saves you from having to calculate its value and store it somewhere.
///DEPENDENCY
///When it comes to dependencies
///— whether your property’s value relies on the values of your other properties —
///then the tables are turned:
///this is a place where computed properties are useful,
///because you can be sure the value they return always takes into account the latest program state.
///NOTE
///`Lazy properties` help mitigate the performance issues of _rarely read stored properties_,
///and `property observers` mitigate the dependency problems of stored properties
///— we’ll be looking at them soon.



/// How to take action when a property changes
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-take-action-when-a-property-changes
/// TIP:
/// Please try to avoid putting too much work into property observers
/// — if something that looks trivial such as `game.score += 1` triggers intensive work,
/// it will catch you out on a regular basis and cause all sorts of performance problems.
/// NOTE
/// SwiftUI uses `willSet` in some places to handle animations
/// so that it can take a snapshot of the user interface before a change.
/// When it has both the “before” and “after” snapshot,
/// it can compare the two to see all the parts of the user interface that need to be updated.

struct Game {
    
    var score: Int
}

var game = Game.init(score: 20)
game.score -= 5
print("The score is now \(game.score).")


struct Play {
    var score: Int {
        /// `willSet`runs  code _before_ the property changes:
        willSet {
            print("The play score will be \(newValue).")
        }
        /// `didSet`runs  code when the property has changed:
        didSet {
            print("The play score was \(oldValue).")
            print("The play score is now \(score).")
        }
    }
}

var play = Play.init(score: 30)
play.score -= 5



struct App {
    
    var title: String = "anaonymous" {
        willSet {
            print("The current value is: \(title)")
            print("The new value will be: \(newValue)")
        }
        
        didSet {
            print("The new value is: \(title)")
            print("The old value was: \(oldValue)")
        }
    }
    
    var contacts = Array<String>() {
        willSet {
            print("The current array is: \(contacts)")
            print("The new array will be: \(newValue)")
        }
        
        didSet {
            print("The new array is: \(contacts)")
            print("The old array was: \(oldValue)")
        }
    }
}


var app = App.init(title: "Hello World")
app.title = "Hello Again"
app.contacts.append("Dorothy")
app.contacts.append("Ozma")



struct BankAccount {
    
    var name: String
    var isMillionaire: Bool = false
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionaire = true
            } else  {
                isMillionaire = false
            }
        }
    }
}


struct Child {
    
    var name: String
    var age: Int {
        
        didSet {
            print("Happy birthday \(name).")
        }
    }
}

var child = Child.init(name: "Dorothy",
                       age: 11)
child.age = 15


struct Dog {
    
    var age: Int {
        didSet {
            let dogAgeToHumanAge = age * 7
            print("The dog is now \(dogAgeToHumanAge) years old in Human years.")
        }
    }
}

var dog = Dog.init(age: 3)
dog.age = 5


struct Student {
    
    var debt: Int {
        didSet {
            switch debt {
            case 0..<1_000: print("Okay debt")
            case 1_000..<5_000: print("Reasonable debt")
            case 5_000..<10_000: print("Sizeable debt")
            default: print("Can I fake my own death?")
            }
        }
    }
}

var student = Student.init(debt: 100)
student.debt = 3_000



/// How to create custom initializers
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-custom-initializers
/// IMPORTANT:
/// Although you can call other methods of your struct inside your initializer,
/// you can’t do so before assigning values to all your properties
/// — Swift needs to be sure everything is safe before doing anything else.

struct Player {
    
    var name: String
    var id: Int
}

let player = Player.init(name: "Dorothy",
                         id: 5)


struct CustomPlayer {
    
    var name: String
    var id: Int
    
    
    init(name: String) {
        
        self.name = name
        self.id   = Int.random(in: 0...100)
    }
    
    init(customName: String,
         customId: Int) {
        /// OLIVIER: Using custom parameter names,
        /// you can remove `self`in the initialiser
        /// as everything is clear to the compiler now:
        name = customName
        id   = customId
    }
}

let customPlayer = CustomPlayer.init(name: "Dorothy")
print("Custom player id: \(customPlayer.id)")


struct AnotherPlayer {
    
    var name: String
    var id: Int = 3
    
    init(name: String) {
        self.name = name
    }
}

var anotherPlayer = AnotherPlayer.init(name: "Ozma")
print("Another player ID: \(anotherPlayer.id)")
//var anotherPlayer2 = AnotherPlayer(name: "Glinda", id: 5)
/// OLIVIER: You cannot add `id` to the initializer.
/// OLIVIER: You will need to add another initializer to the struct.
/// TIP:
/// As soon as you add a custom initializer for your struct,
/// the default memberwise initializer goes away.
/// If you want it to stay,
/// move your custom initializer to an `extension`, like this:

extension Player {
    
    init(name: String) {
        self.name = name
        self.id = Int.random(in: 0...99)
    }
}

let playerExtension = Player.init(name: "Glinda")
print("Player extension ID: \(playerExtension.id)")

/// NOTE:
/// Outside of initializers, the main reason for using `self` is
/// because we are in a closure
/// and Swift requires it so we are clear we understand what is happening.
/// This is only needed when accessing `self` from inside a closure that belongs to a `class`,
/// and Swift will refuse to build your code unless you add it.


struct Country {
    
    var name: String
    var isUsingImperialMeasurements: Bool
    
    init(countryName: String) {
        name = countryName
        let countries: [String] = [
            "Liberia", "Myanmar", "USA"
        ]
        isUsingImperialMeasurements = countries.contains(name) ? true : false
    }
}


struct Message {
    
    var from: String
    var to: String
    var content: String
    
    init() {
        from = "Unknown sender"
        to = "Unknown destination"
        content = "Unknown content"
    }
}


struct Cabinet {
    
    var width: Double
    var height: Double
    var area: Double
}

extension Cabinet {
    
    init(customWidth: Double,
         customHeight: Double) {
        
        width = customWidth
        height = customHeight
        area = width * height
    }
}

let cabinet = Cabinet.init(customWidth: 3.0,
                           customHeight: 5.0)
print("The area of the cabinet is \(cabinet.area).")


struct Character {
    
    var name: String
    var actor: String
    var isProbablyGoingToDie: Bool
    
    init(customName: String,
         actor: String) {
        
        name = customName
        self.actor = actor
        isProbablyGoingToDie = self.actor == "Dorothy" ? false : true
    }
}

let character = Character(customName: "Gale",
                          actor: "Dorothy")
character.isProbablyGoingToDie // false

//: [Next](@next)
