import UIKit
import Darwin

// Tuples - like arrays but can be accessed with names or index
var usersName = (fName: "Jeremy", lName: "Hernandez")

// Dictionaries - collections of values just like arrays, but rather than storing their position with an integer you can use whatever you want
var heights = [
    "Bruno" : 1.66,
    "Elon" : 2.10
]

// Access value form dictionary using keys
heights["Bruno"]
heights["Jeremy", default: 0]

// Creating empty collections
var empDict = [String : String]()
var empArr = [Int]()
var empSet = Set<String>()

// You can also set empty Dictionaries and Arrays with the same syntax as Sets
var empDict2 = Dictionary<String, Int>()

// You can always assign values to the empty collection later on
empDict["Jeremy"] = "Brown Hair"

// Enumerations - or just enums - are a way to group similarly related values together
enum Result {
    case success
    // Success code
    
    case failure
    // Fail code
}

// This helps to prevent using different values each time
var result = Result.failure

// Enum associated values help you assign more information to your case
enum Activity {
    case talking(topic: String)
    case walking(distance: Float)
    case running(speed: Int)
    case biking(location: String)
}

let talking = Activity.talking(topic: "Football")

// Enum raw values - assign values to enums so they have meaning
enum Planets: Int {
    // Assign mercury the rawValue of 1
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planets(rawValue: 3)
