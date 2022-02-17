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

var employee1 = Employee1(name: "Dorothy", vacationRemaining: 14)

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

//: [Next](@next)
