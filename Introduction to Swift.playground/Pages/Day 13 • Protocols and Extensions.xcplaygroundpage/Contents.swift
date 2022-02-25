//: [Previous](@previous)

import Foundation

///How to create and use protocols
///https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-protocols
///Protocols let us define how a `struct`, `class`, and `enum` ought to work.
///In practice, what protocols allow us to do, is, treat our data in more general terms.

protocol Vehicle {
    ///A `String` called `typeOfVehicle`, which must be _readable_.
    ///That might mean it is a constant,
    ///but it might also be a computed property with a _getter_ only.
    var typeOfVehicle: String { get }
    ///An integer called `numberOfPassengers`, which must be _read-write_.
    ///That might mean it is a variable,
    ///but it might also be a computed property with a _getter and setter_.
    var numberOfPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int) -> Void
}


/// It works both for classes and structs:
// class Car: Vehicle {
struct Car: Vehicle {
    
    let typeOfVehicle: String = "car"
    var numberOfPassengers: Int
    
    
    func estimateTime(for distance: Int)
    -> Int {
        
        print("Estimating time for driving \(distance) km by car...")
        return distance / 50
    }
    
    
    func travel(distance: Int)
    -> Void {
        
        print("I am driving \(distance) km.")
    }
    
    
    func openSunroof() {
        
        print("It is a lovely day!")
    }
}

/// It works both for classes and structs:
// class Bicycle: Vehicle {
struct Bicycle: Vehicle {
    
    var numberOfPassengers: Int = 1
    var isEBike: Bool
    var typeOfVehicle: String {
        
        get {
            isEBike ? "e-bike" : "push bike"
        }
        
//        set {
//            newValue
//        }
    }
    
    
    func estimateTime(for distance: Int)
    -> Int {
        
        let divider = isEBike ? 30 : 10
        
        print("Estimating time for cycling \(distance) km by \(typeOfVehicle)...")
        return distance / divider
    }
    
    
    func travel(distance: Int)
    -> Void {
        
        print("I am cycling \(distance) km.")
    }
}

let car = Car.init(numberOfPassengers: 3)
let bicycle = Bicycle.init(isEBike: true)

var vehicles = Array<Vehicle>()
vehicles.append(car)
vehicles.append(bicycle)




func getTravelEstimates(using vehicles: [Vehicle],
                        for distance: Int)
-> Void {
    
    for eachVehicle in vehicles {
        
        print("Estimated time by \(eachVehicle.typeOfVehicle): \(eachVehicle.estimateTime(for: distance)) hours.")
    }
}

getTravelEstimates(using: vehicles,
                   for: 300)


///NOTE:
///As well as accepting protocols as parameters,
///you can also _return protocols_ from a function if needed.

///TIP:
///If you ever need to subclass something and conform to a protocol,
///you should put the parent class name first,
///then write your protocols afterwards.



/// Why does Swift need protocols?
/// https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-need-protocols

protocol CanBePurchased {
    
    var name: String { get set }
    var type: String { get }
}


struct Book: CanBePurchased {
    
    let type: String = "book"
    var name: String
    let author: String
}


struct CD: CanBePurchased {
    
    let type: String = "cd"
    var name: String
    let artist: String
}


let book: Book = Book.init(name: "Emerald city",
                           author: "Dorothy")
let cd: CD = CD.init(name: "Scene Delete",
                     artist: "Sasha")


func buy(_ item: CanBePurchased) {
    
    print("Buying a \(item.type) with the title \"\(item.name)\".")
}


buy(book)
buy(cd)


/// How to use opaque return types
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-use-opaque-return-types

func getRandomNumber()
// -> Int {
// -> Equatable {
    /// ERROR:
    /// Protocol `Equatable` can only be used as a generic constraint
    /// because it has `Self` or associated type requirements.
/// To create an _opaque return_ type,
/// add the keyword `some` before their return type, like this:
-> some Equatable {
    
    let randomNumber = Int.random(in: 1...10)
    print("Random number: \(randomNumber)")
    
    return randomNumber
}


func getRandomAnswer()
-> some Equatable {
    
    let randomAnswer = Bool.random()
    print("Random answer: \(randomAnswer)")
    
    return randomAnswer
}


getRandomNumber() == getRandomNumber()
getRandomAnswer() == getRandomAnswer()
// getRandomAnswer() == getRandomNumber() // ERROR

/// Returning an _opaque return type_ means
/// we still get to focus on the functionality we want to return rather than the specific type,
/// which in turn allows us to change our mind in the future without breaking the rest of our code.



/// How to create and use extensions
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-extensions


var quote = "       hello world"
let trimmedQuote = quote.trimmingCharacters(in: CharacterSet.whitespaces)


extension String {
    
     // /////////////////////////
    // MARK: Computed Properties
    
    var lines: [String] {
        /// `components` breaks the `String` up into a `String Array`
        /// by splitting it on a boundary of our choosing:"
        return self.components(separatedBy: CharacterSet.newlines)
    }
    
    
     // /////////////
    // MARK: Methods
    
    func trimmed()
    -> String {
        
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    
//    func trim(_ word: Self)
//    -> Void {
//
//        word.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//    }
    mutating func trim() {
        
        /// The value is not returned, but changed in place.
        self = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}


var anotherQuote: String = "           hello again"
let anotherTrimmedQuote: String = anotherQuote.trimmed()


/// Global Function:
/// OLIVIER:
/// Notice how the value is only changed locally.
/// The value is not changed in place from the method,
/// or the method does not return the changed value.
func trim(_ word: String)
-> Void{

    word.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
}
///Writing global functions makes your code rather messy
///— they are hard to organize and hard to keep track of.
///On the other hand,
///extensions are naturally grouped by the data type they are extending.
///What’s more,
///extensions make it easier to modify values in place
///`finalQuote.trim()`
///— i.e., to change a value directly, rather than return a new value.


var finalQuote: String = "         So long."
var globalQuote: String = "      Hola"

/// Global function:
trim(globalQuote)
print("Global Quote trimmed: \(globalQuote)")

let capturedTrimmedGlobalQuote: String = globalQuote.trimmed()
print("Captured Quote trimmed: \(capturedTrimmedGlobalQuote)")

/// Function in the Extension:
finalQuote.trim()
print("Final Quote trimmed: \(finalQuote)")

let finalTrimmedQuote: String = "     Thursday"
finalTrimmedQuote.trimmed()


let lyrics: String = """
Blue
Yellow
Red
Green
"""

lyrics.lines.count // 4



/// How to create and use protocol extensions
/// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-protocol-extensions

extension Collection {
    
    var isNotEmpty: Bool {
        
        return self.isEmpty == false
    }
}


let guests: [String] = [
    "Dorothy", "Ozma", "Glinda"
]


if guests.isEmpty == false {
    
    print("Guest count: \(guests.count)")
}


if guests.isNotEmpty {
    
    print("Guest count: \(guests.count)")
}


protocol Human {
    
    var name: String { get }
    func sayHello() -> Void
}


extension Human {
    
    func sayHello()
    -> Void {
        
        print("Hello \(name)!")
    }
}


struct Person: Human {
    
    var name: String
    
    
    func sayHello()
    -> Void {
        
        print("Hello again, \(name)!")
    }
}


let dorothy: Person = Person(name: "Dorothy Gale")
dorothy.sayHello()




///How to get the most from protocol extensions
///https://www.hackingwithswift.com/quick-start/beginners/how-to-get-the-most-from-protocol-extensions

// extension Int {
/// Both `Int`and `Double`adopt the Numeric protocol:
extension Numeric {
    
    func squared()
    // -> Int {
    -> Self {
        
        return self * self
    }
}
///NOTE
///`self` refers to the current value,
///and `Self` refers to the current type.

let number: Int = 5
5.squared()
number.squared()

let doubleNumber: Double = 6
doubleNumber.squared()



struct User: Equatable,
             Comparable {
    
    var name: String
    
    
    static func < (lhs: User,
                   rhs: User)
    -> Bool {
        
        lhs.name < rhs.name
    }
}


let user1: User = User.init(name: "Dorothy")
let user2: User = User.init(name: "Ozma")
user1 == user2
user1 < user2
user1 >= user2
///we don’t even need to add `Equatable` to our struct in order to get `==` to work.
///Behind the scenes,
///Swift uses _protocol inheritance_
///so that `Comparable` automatically also means `Equatable`.


//: [Next](@next)
