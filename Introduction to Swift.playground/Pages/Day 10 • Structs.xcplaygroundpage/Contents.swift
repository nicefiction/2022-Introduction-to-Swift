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

//: [Next](@next)
