import UIKit

// Creating a struct

struct Sport {
    // Stored property - value is given
    var name: String
    var isOlympicSport: Bool

    // Computed property - code must be run to gather value
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an olympic sport"
        } else {
            return "\(name) is not an olympic sport"
        }
    }
}

// Here we are defining the type so we can create and use an instance of the Sport struct
var tennis = Sport(name: "Tennis", isOlympicSport: false)
tennis.name = "Lawn Darts"
print(tennis.olympicStatus)

struct Progress {
    var task: String

    // didSet will run code whenever amount changes value
    var amount: Int {
        didSet {
            print("\(task) is currently \(amount)% complete")

            if amount == 100 {
                print("Task complete.")
            }
        }

        // willSet will run code before amount changes value
        willSet {
            print("\(task) is about to go up one percent...")
        }
    }
}

var progress = Progress(task: "Loading Data", amount: 0)
for _ in 1...100 {
    progress.amount += 1
}

// Methods in Structs
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())


// Mutating properties
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

// person is ed
var person = Person(name: "ed")
person.makeAnonymous() // person is now mutated into the Anonymous value because of makeAnonymous()
print(person.name) // Anonymous


// Strings are structs as they have properties and methods
let string = "The little fox jumped over the hill"
print(string.count)
print(string.uppercased())
print(string.sorted())
print(string.contains("x"))

// Arrays are structs as they have properties and methods
var toys = ["Woody"]
print(toys.count)
toys.append("buzz")
toys.firstIndex(of: "buzz")
print(toys.sorted())
toys.remove(at: 1)
print(toys)


struct dayOfSwift {
    var streakNumber: Int
    
    func printMyStreak() {
        print("Day \(streakNumber) of 100 days of Swift!")
    }
}

let dayEight = dayOfSwift(streakNumber: 8)
dayEight.printMyStreak()
