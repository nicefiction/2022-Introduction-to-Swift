//: [Previous](@previous)

import Foundation

///How to limit access to internal data using access control.
///https://www.hackingwithswift.com/quick-start/beginners/how-to-limit-access-to-internal-data-using-access-control

struct BankAccount {
    
    var funds: Int
    
    mutating func deposit(amount: Int) {
        
        funds += amount
    }
    
    
    mutating func withdraw(amount: Int)
    -> Bool {
        
        return amount < funds ? true : false
    }
}


var bankAccount = BankAccount.init(funds: 100)
bankAccount.deposit(amount: 200)
bankAccount.withdraw(amount: 250)

bankAccount.funds -= 1_000
///That completely bypasses the logic we put in place to stop people taking out more money than they have,
///and now our program could behave in weird ways.
print(bankAccount.funds)
///To solve this,
///we can tell Swift that funds should be accessible only inside the struct
///— by methods that belong to the struct,
///as well as any computed properties, property observers, and so on.


struct PrivateBankAccount {
    ///Use `private` for _don’t let anything outside the struct use this._
    private var funds: Int
    
    init(funds: Int) {
        
        self.funds = funds
    }
    
    
    mutating func deposit(amount: Int) {
        
        funds += amount
    }
    
    
    mutating func withdraw(amount: Int)
    -> Bool {
        
        return amount < funds ? true : false
    }
}


var privateBankAccount = PrivateBankAccount(funds: 0)
/// ERROR When there is no custom initializer:
/// `PrivateBankAccount` initializer is inaccessible due to `private` protection level
// privateBankAccount.funds
/// ERROR: `funds` is inaccessible due to `private` protection level.

/// There is one extra option that is sometimes useful for learners, which is this: `private(set)`.
/// This means _let anyone read this property, but only let my methods write it._
/// If we had used that with `BankAccount`,
/// it would mean we could print account.funds outside of the struct,
/// but only `deposit()` and `withdraw()` could actually change the value.

struct PrivateSetBankAccount {
    
    private(set) var funds: Int
    
    mutating func deposit(amount: Int) {
        
        funds += amount
    }
    
    
    mutating func withdraw(amount: Int)
    -> Bool {
        
        return amount < funds ? true : false
    }
}

var privateSetBankAccount = PrivateSetBankAccount(funds: 0)
print(privateSetBankAccount.funds)


/// IMPORTANT:
/// If you use `private` access control for one or more properties,
/// chances are you’ll need to create your own initializer.
/// When you use a private property,
/// Swift is unable to generate its memberwise initializer for us.

///What is the point of access control?
///https://www.hackingwithswift.com/quick-start/understanding-swift/whats-the-point-of-access-control
///By using `private`  I am asking Swift to enforce the rules for me:
///don’t let me read or write this property from anywhere outside the  struct.
///One other advantage to access control is that it lets us control how other people see our code:
///If I mark properties as `private`
///then it is immediately clear that you shouldn’t be using them externally.
///https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html

struct Human {
    
    var name: String
    var age: Int
    private(set) var password: String = "12345"
    
    
    init(name: String,
         age: Int) {
        
        self.name = name
        self.age  = age
    }
}

let human = Human(name: "Dorothy", age: 17)
human.password
// human.password = "54321"
/// ERROR: Cannot assign to property: `password`'
/// setter is inaccessible.


struct RebelBase {
    
    private var location: String
    private(set) var peopleCount: Int
    
    init(location: String,
         peopleCount: Int) {
        
        self.location = location
        self.peopleCount = peopleCount
    }
}


let rebelBase = RebelBase(location: "Earth", peopleCount: 5)
// rebelBase.location
/// ERROR:`location` is inaccessible due to `private` protection level.
// rebelBase.location = "Mars"
/// ERROR:`location` is inaccessible due to `private` protection level.
// rebelBase.peopleCount += 1
/// ERROR: Left side of mutating operator isn't mutable:`peopleCount` setter is inaccessible.
rebelBase.peopleCount // 5
/// `private`: I cannot read or write the property outside of the struct.
/// `private(set)`:I can read the property outside the struct. BUT I cannot write the property outside the struct.


struct School {
    
    var staff: [String]
    private var students: [String]
    
    init(staff: String...,
         students: [String]) {
        
        self.staff = staff
        self.students = Array<String>()
    }
}


let school = School(staff: "Glinda",
                    students: ["Dorothy"])



struct App {
    
    var name: String
    private var downloads: Int = 0
    
    
    init(name: String) {
        
        self.name = name
    }
}

let app = App(name: "Weather")
app.name
// app.downloads
///ERROR: `downloads`is inaccessible due to `private` protection level.



/// Static properties and methods
/// https://www.hackingwithswift.com/quick-start/beginners/static-properties-and-methods
/// Use this technique  for two things:
/// (1) Creating example data,
/// and (2) storing fixed data that needs to be accessed in various places.

struct AnotherSchool {
    
    static var studentCount: Int = 0
    
    /// NOTICE how we are able to modify the `studentCount` property
    /// without marking the method as `mutating`
    /// — the `mutating`keyword is only needed with regular struct functions
    /// for times when an instance of struct was created as a constant,
    /// and there is no instance when calling `add()`.
    static func add(student name: String) {
        
        print("Adds a new student with name \(name).")
        studentCount += 1
    }
}


AnotherSchool.studentCount
AnotherSchool.add(student: "Dorothy")
AnotherSchool.studentCount

/// Use `static` properties to organize common data in your apps:

struct AppData {
    
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

///What’s the point of static properties and methods in Swift?
///https://www.hackingwithswift.com/quick-start/understanding-swift/whats-the-point-of-static-properties-and-methods-in-swift

/// Using this approach,
/// everywhere I need to check or display something like my app’s version number
/// — an about screen, debug output, logging information, support emails, etc —
/// I can read `AppData.version`.

///The second reason to use `static` data is
///to create examples of your structs.

struct Employee {
    
    var name: String
    var role: String
    
    static let example = Employee(name: "exampleName",
                                  role: "exampleRole")
}

///And now
///whenever you need an `Employee` instance to work with in your design previews,
///you can use `Employee.example` and you are done.


struct NewsStory {
    
    static var BreakingNewsCount: Int = 0
    static var RegularNewsCount: Int = 0
    
    var headline: String
    
    
    init(headline: String,
         isBreakingNews: Bool) {
        
        self.headline = headline
        if isBreakingNews {
            Self.BreakingNewsCount += 1
        } else {
            Self.RegularNewsCount += 1
        }
    }
}


struct Cat {
    
    static var allCats = Array<Cat>()
    
    
    init() {
        /// Referencing a `static` property inside a regular method isn't allowed;
        // allCats.append(self)
        /// This should use Person.population
        Self.allCats.append(self)
    }
}

let cat = Cat()
print("Number of cats in the Static Cat Array: \(Cat.allCats.count)")


struct Raffle {
    
    static var ticketsUsed: Int  = 0
    
    var name: String
    var tickets: Int
    
    init(name: String,
         tickets: Int) {
        
        self.name = name
        self.tickets = tickets
        Self.ticketsUsed += tickets
    }
}

//: [Next](@next)
