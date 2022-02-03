import Cocoa

/// Simple Data Types: Part 2

/// 2.1 How to store truth in Booleans
// https://www.hackingwithswift.com/quick-start/beginners/how-to-store-truth-with-booleans

let imageName = "dorothy.jpg"
imageName.hasSuffix(".jpg")

let number = 120
let isMultipleOf3 = number.isMultiple(of: 3)

let goodDogs = true
let badDogs = false


var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)


var gameOver = false
print("Game Over: \(gameOver)")
gameOver.toggle()
print("Game Over: \(gameOver)")



/// 2.2 How to join strings together
// https://www.hackingwithswift.com/quick-start/beginners/how-to-join-strings-together

let subject = "Haters "
let action = " hate!"
/// Operator Overloading:
/// The ability for one operator such as `+` to mean different things depending on how it is used.
let lyrics = subject + "are gonna" + action
/// TIP:
/// This technique works great for small things,
/// but you wouldn’t want to do it too much.
/// Each time Swift sees two strings being joined together using `+`
/// it has to make a new string out of them before continuing,
/// and if you have lots of things being joined
/// it is quite wasteful.

let name = "Dorothy"
let age = 17
let introduction = "Hello my name is \(name) and I am \(age) years old."

let calculation = "5 x 5 = \(5 * 5)"
