import UIKit

// Functions - with parameters returning a string

func square(number: Int) -> String {
    return "The square of \(number) is \(number * number)"
}

for num in 1...100 {
    print(square(number: num))
}

// Function labels - you can give a parameter two labels. One to be used externlly to call the function and one to be used internally for the function.

// Uses the "name" label
func sayHello(to name: String) {
    print("Hello, \(name)!")
}
// Uses the "to" label
sayHello(to: "Jack")

// Omitting parameter labels using _
func greet(_ name: String) {
    print("Hello, \(name)!")
}

greet("Talon")

// Default paramters - automativally sets nicely to true if not set explicitly
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Jeremy")
greet("Jacob", nicely: false)

// Variadic functions - take any number of parameters of the same type
func square(numbers: Int...) {
    for number in numbers {
        print("The square of \(number): \(number * number)")
    }
}

square(numbers: 5, 3, 9, 13, 2, 5, -3, 82)

// inout functions - change the value of a parameter inside and outside the function as values that enter fuctions are constant
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)

// This enum describes the error that we can throw
enum PasswordError: Error {
    case obvious
}

// Throw an error before the return type
func checkPassword(_ password: String) throws ->
    Bool {
        if password == "password" {
            throw PasswordError.obvious
        }
        
    return true
}

// do - used for a section of code that can cause problems
// try - used before every function that might cause an error
// catch - handle errors gracefully
do {
    try checkPassword("password")
    print("That password is good")
} catch {
    print("Password is too weak...")
}
