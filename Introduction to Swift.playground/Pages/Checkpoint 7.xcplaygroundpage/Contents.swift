//: [Previous](@previous)

import Foundation
import CoreGraphics

/**
 Checkpoint 7:
 • Make a class hierarchy for animals.
 • Start with `Animal`. Add a `legs` property for the number of legs an animal has.
 • Make `Dog` a subclass of `Animal`, giving it a `speak()` method that prints
 a dog barking string,
 but each subclass should print something different.
 • Make `Corgi` and `Poodle` subclasses of `Dog`.
 • Make `Cat` an `Animal` subclass.
 Add a `speak()` method, with each subclass
 printing something different, and an `isTame` Boolean,
 set with an initializer.
 • Make `Persian` and `Lion` as subclasses of `Cat`.
 */

class Animal {
    
    var numberOfLegs: Int
    
    init(numberOfLegs: Int) {
        
        self.numberOfLegs = numberOfLegs
    }
}


class Dog: Animal {
    
    func speak() {
        
        print("A barking dog.")
    }
}


final class Corgi: Dog {
    
    override func speak() {
        
        print("A barking Corgi.")
    }
}


final class Poodle: Dog {
    
    override func speak() {
        
        print("A barking Poodle.")
    }
}


class Cat: Animal {
    
    var isTame: Bool
    
    
//    init(isTame: Bool,
//         numberOfLegs: Int) {
//
//        self.isTame = isTame
//        super.init(numberOfLegs: numberOfLegs)
//    }
    init(isTame: Bool) {
        
        self.isTame = isTame
        super.init(numberOfLegs: 4)
    }
    
    
    func speak() {
        
        print("A meowing Cat.")
    }
}


class Persian: Cat {
    
    override func speak() {
        
        print("A mewoing Persian cat.")
    }
}


class Lion: Cat {
    
    override func speak() {
        
        print("A roaring Lion cat.")
    }
}






//: [Next](@next)
