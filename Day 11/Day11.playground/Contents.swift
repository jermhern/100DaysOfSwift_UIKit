import UIKit

// protocols, extensions, and protocol extensions

// Protocols just tell you what the struct requires
protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("my id is \(thing.id)")
}

// Protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {
    // Nothing needs to go in here since it inherits existing protocols
}

// Extension
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

// Protocol Extensions like a regular extension, you can extend a whole protocol on all of your types
// Two different types
let beatles = ["ringo", "john"]
let progLanguages = Set(["swift", "python"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print("My name is \(name)")
        }
    }
}

// Applied across all types
beatles.summarize()
progLanguages.summarize()

// Protocol-oriented programming
protocol IdentifiableUser {
    var id: String { get set }
    func identify()
}

extension IdentifiableUser {
    func identify() {
        print("My user id is: \(id)")
    }
}

struct ProgUser: IdentifiableUser {
    var id: String
}

var user = ProgUser(id: "Jeremy")
user.identify()

protocol IdentifiableProgrammer {
    var name: String { get set }
    var language: String { get set }
    var isDoing100Days: Bool { get set }
    var streakNumebr: Int { get set }
}

extension IdentifiableProgrammer {
    func getData() {
        print("Programmer name: \(name)")
        print("Programming language: \(language)")
        
        if isDoing100Days {
            print("Streak number: \(streakNumebr)")
        } else {
            print("Working on something new...")
        }
    }
}

struct ProgrammerData {
    var name: String
    var language: String
    var isDoing100Days: Bool
    var streakNumebr: Int
}

let jeremy = ProgrammerData(name: "Jeremy", language: "Swift", isDoing100Days: true, streakNumebr: 11)

