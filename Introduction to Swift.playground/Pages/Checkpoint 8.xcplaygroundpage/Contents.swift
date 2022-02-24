//: [Previous](@previous)

import Foundation

/**
 Checkpoint 8
 Make a protocol that describes a building.
 Your protocol should require the following:
 • A property storing how many rooms it has.
 • A property storing the cost as an integer.
 • A property storing the name of the estate agent selling the building.
 • A method for printing the sales summary of the building.
 • Create two structs, `House` and `Office`, that conform to it.
 */

protocol Building {
    
    var numberOfRooms: Int { get set }
    var costOfBuilding: Int { get set }
    var nameEstateAgent: String { get }
    
    func printSalesSummary() -> Void
}


extension Building {
    
    func printSalesSummary()
    -> Void {
        
        print("""
\(nameEstateAgent) has sold the building.
The building has \(numberOfRooms) \(numberOfRooms == 1 ? "room" : "rooms").
The cost of the building is \(costOfBuilding) €.
""")
    }
}


struct House: Building {
    
    var numberOfRooms: Int
    var costOfBuilding: Int
    var nameEstateAgent: String
}


struct Office: Building {
    
    var numberOfRooms: Int
    var costOfBuilding: Int
    var nameEstateAgent: String
}


let house: House = House.init(numberOfRooms: 8,
                              costOfBuilding: 300_000,
                              nameEstateAgent: "Livingstone")
house.printSalesSummary()


//: [Next](@next)
