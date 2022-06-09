import UIKit

// Classes
class Dog {
    var name: String
    var breed: String

    // Similar to structs but you must create your own initializer
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }

    func bark() {
        print("bork, bork.")
    }
}

let poodle = Dog(name: "Foofsi", breed: "Poodle")
print("Look, a dog! Its name is \(poodle.name) and its breed is a \(poodle.breed)")

// Class inheritance
class Poodle: Dog {
    // Create an initializer pointining to a property of a child class
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }

    override func bark() {
        print("fancy bork.")
    }
}

let foofsi = Poodle(name: "foofsi")
// As the Poodle class inherits form the Dog class you are able to call bark()
foofsi.bark()

// Deinitializers - code that is run when an instance of a class is destroyed
class Programmer {
    var name = "Jeremy"

    init() {
        print("\(name) is a programmer.")
    }

    func commenceProgramming() {
        print("They are plugged in and programming!")
    }

    deinit {
        print("ARE YOU PLUGGED IN NOW?")
        print("Programming has ceased.")
    }
}

for _ in 1...3 {
    // Programmer created - init
    let coder = Programmer()
    coder.commenceProgramming()
    // Programmer destroyed - deinit
}

class SwiftProgrammer {
    let name: String
    let streak: Int
    
    init(name: String, streak: Int) {
        self.name = name
        self.streak = streak
    }
    
    func startDailySwift() {
        print("\(name) is starting day \(streak).")
        
        if streak % 10 == 0 {
            print("\(name) is \(100/streak)% done...")
        }
    }
}

let jeremy = SwiftProgrammer(name: "Jeremy", streak: 10)
jeremy.startDailySwift()
