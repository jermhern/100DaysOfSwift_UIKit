import UIKit

var score = 12

// This will assign the remainder of 60 / score to remainder which is 0
var remainder = 60 % score

// This will assign the remainder of 61 / score to remainder which is 1
var remainderOfOne = 61 % score

// Switch statements - good to utilize if you have multiple if/if else statements
let weather = "sunny"

switch weather {
case "rain":
    print("bring an umbrella")
case "snow":
    print("bring snow boots")
case "sunny":
    print("wear sunscreen") // This line is executed as weather == "sunny"
default:
    print("have a good day")
}
