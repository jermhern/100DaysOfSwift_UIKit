//import UIKit
//
//// To make a type optional, add a question mark after it
//var age: Int? = nil // -> this holds NOTHING
//var name: String? = nil
//
//if let unwrappedAge = age {
//    print("Age: \(unwrappedAge).")
//} else {
//    print("Missing age.")
//}
//
//age = 35
//
//// Using guard let
//func greet(_ name: String?) {
//
//    // Deal with problems at the start of your function
//    // Return and continue with function
//    guard let unwrapped = name else {
//        print("You didnt return a name")
//        return
//    }
//
//    print("Hello, \(unwrapped)")
//}
//
//// Optional Chaining
//let names = ["Jeremy", "Chloe"]
//let personInCouple = names.first?.uppercased()
//
//// Failable init()'s
//struct Person {
//    var id: String
//
//    init?(id: String) {
//        if id.count == 9 {
//            self.id = id
//        } else {
//            return nil
//        }
//    }
//}
//
//// Typecasting
//// Perfomring a typecast consists of checking to see if an object is what you say it is
//// Using as? we can check and perform code, it will return nil if the objects do not match
//class Animal {}
//class Fish: Animal {}
//class Dog: Animal {
//    func makeNoise() {
//        print("bork")
//    }
//
//}
//
//let pets = [Fish(), Dog()]
//
//for pet in pets {
//    if let dog = pet as? Dog {
//        dog.makeNoise()
//    }
//}

func streakNumber(_ day: Int?) -> String {
    guard let day = day else {
        return "Looks like someone didn't study!"
    }
    
    return "\(day) of 100 days of Swift complete!"
}

let whatDayOfSwift = streakNumber(12)
print(whatDayOfSwift)
