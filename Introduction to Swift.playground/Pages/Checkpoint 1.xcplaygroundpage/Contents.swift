//: [Previous](@previous)

import Foundation

/// Your goal is to write a Swift playground that:
/// Creates a constant holding any temperature in Celsius.
/// Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
/// Prints the result for the user, showing both the Celsius and Fahrenheit values.

let temperatureInCelsius = 8.0
/// GOTCHA:
/// Celsius is commonly stored as a decimal,
/// so make sure and create it as one.
/// This might mean adding `.0` to the end – using `8.0` rather than `8`, for example.
let temperatureInFahrenheit = ((temperatureInCelsius * 9) / 5) + 32
print("\(temperatureInCelsius)° Celsius is \(temperatureInFahrenheit)° Fahrenheit")

//: [Next](@next)
