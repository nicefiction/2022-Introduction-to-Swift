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

//: [Next](@next)
