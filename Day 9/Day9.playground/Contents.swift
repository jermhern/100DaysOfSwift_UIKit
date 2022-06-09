import UIKit
import Darwin
import Foundation

// Initializers
struct User {
    var username: String

    // Called when struct is initially assigned to a variable
    init() {
        username = "Anonymous"
        print("Created anon user!")
    }
}

var newUser = User()
newUser.username = "JimBob_69"
print("New Username: \(newUser.username)")

// Reffering to the current instance
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born")
        // Self is referring to the property of the Person struct
        // name is referring to the parameter of init()
        self.name = name
    }
}

let personA = Person(name: "Jeremy")

// lazy & Swift
struct FamilyTree{
    init() {
        print("Generating a family tree!")
    }
}

struct PersonData {
    var name: String
    // Only created the family tree property when it is first accessed
    lazy var familyTree = FamilyTree()

    init(name: String) {
        print("\(name) was born, family tree not generated yet.")
        self.name = name
    }
}

var ed = PersonData(name: "ed")
// Since familyTree was accessed, "ed" now has familyTree as a property
ed.familyTree

// Static properties and methods
struct Student {
    // It only belonds to the struct and not to the instances of the struct
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        print("Please welcome \(name) to the class.")
        // add one to class size everytime a new Student instance has been made
        Student.classSize += 1
    }
}

print("We have \(Student.classSize) Students") // 0
let studentEd = Student(name: "Ed")
let studentJeremy = Student(name: "Jeremy")
print("We have \(Student.classSize) Students") // 2

struct BankUserData {
    // id is only accessible inside the struct
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "Bank ID: \(id)"
    }
}

let jeremyBankUser = BankUserData(id: "12345")
jeremyBankUser.identify()
// This is not able to be used becuase it is private and may only be used inside the struct
// jeremyBankUser.id

struct swiftProgrammerData {
    private var name: String
    private var streak: Int
    
    init(name: String, streak: Int) {
        self.name = name
        self.streak = streak
        self.tweet()
    }
    
    func tweet() {print("\(name) is on day \(streak) of 100 days of Swift!")}
}

var jeremy = swiftProgrammerData(name: "Jeremy", streak: 9)
