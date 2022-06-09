import UIKit

// Closures - when you assign a function to a variable
let driving = {
    print("I am driving a truck.")
}

// Call the closure as if it were a regular function
driving()

// Returning a string from a closure with parameters
let material = { (type: String) -> String in
    return "The material I am using is \(type)."
}

let knittingData = material("yarn")
print(knittingData)

// Passing a closure into a function
func travel(action: () -> Void) {
    print("I am going to start driving")
    driving()
    print("I am done driving")
}

// Call the function with closure as a parameter
travel(action: driving)

// If the last parameter in a function is a closure you can use trailing closure syntax
travel {
    print("I am driving in my car")
}

func daysOfSwift(day: Int, tweet: () -> Void) {
    print("It is day \(day) of swift")
    tweet()
}
daysOfSwift(day: 6) {
  print("tweeting my daily tweet... 🐥")
}

