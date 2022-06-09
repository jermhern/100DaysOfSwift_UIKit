import UIKit

// Advanced closures
// Closures with multiple paramters
func travel(action: (String, Int) -> String) {
    print("I am getting ready to go.")
    let description = action("London", 5)
    print(description)
    print("I have arrived.")
}

// This trailing closure fulfills paramters for the two parameters with $0/$1
travel {
    "I am going to \($0) to \($1)"
}

// How to return a closure from a function
// First arrow signifies the funciton return value
// The second arrow signifies the closure return value
func travel() -> (String) -> Void {
    return {
        print("I am going to \($0)")
    }
}

let result = travel()
result("London")

// Any external values that are used in your closure are captured by swift
func vacation() -> (String) -> Void {
    var counter = 1
    return {
        ("I am going to \($0)")
        counter += 1
    }
}

let vacationResult = vacation()
vacationResult("London")
vacationResult("London")
vacationResult("London")
vacationResult("London")
// The counter inside of the closure has been run 4 times

func whatDay() -> (String, String) -> Void {
    return {
        print("This is day \($0) for closures and day \($1) for swift!")
    }
}

let swiftDateTracker = whatDay()
swiftDateTracker("2", "7")
