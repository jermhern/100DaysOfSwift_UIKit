//
//  ViewController.swift
//  Project2
//
//  Created by Jeremy on 5/21/22.
//

import UIKit

class ViewController: UIViewController {

    // Flags on view
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var Fact: UILabel!
    
    var countries = [String]()
    var facts = ["Spain Is The Only European Country To Have A Physical Border With An African Country.", "Spain Was The World’s First Global Empire.", "Spanish Is The World’s Second-Most Spoken Native Language.", "The British drink over 163 million cups of tea daily.", "The accent of the UK changes noticeably every 25 miles.", "In the UK, it is illegal for anyone to die in the Houses of Parliament.", "The Queen, Elizabeth II, has visited over 115 countries despite not having a passport.", "France is the largest country in the EU and sometimes called the hexagon.", "France is the world’s most popular tourist destination.", "French was the official language of England for about 300 years.", "The French invented tin cans, the hairdryer, and the hot air balloon.", "Belonging to the U.S, Old Glory Was Designed By A High School Student.", "The U.S Has The World’s Biggest GDP.", "In the U.S, Almost All Of the State of Nevada Is Owned By The Government."]
    
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // Allow navBar to show line at the top, traditionally shown in iOS 14
        let navBar = self.navigationController?.navigationBar
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = standardAppearance
        
        // Border will be measures in points
        Button1.layer.borderWidth = 2
        Button2.layer.borderWidth = 2
        Button3.layer.borderWidth = 2
        
        // Convert UIColor to cgColor with the property
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(getScore))

        newGame()
    }
    
    @objc func getScore() {
        let ac = UIAlertController(title: "Current score:", message: String(score), preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Close", style: .destructive))
        present(ac, animated: true)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        // Generate the answer for the game
        correctAnswer = Int.random(in: 0...2)
        
        // Randomize the flags & facts that are shown to the user
        countries = countries.shuffled()
        facts = facts.shuffled()
        
        // for: .normal tells us which state of the button should be changed
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Convert UIColor to cgColor with the property
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        // Set text label to random fact in fact array
        //Fact.text = facts[0]
        
        // Title of the Navigation controller
        title = "Which flag belongs to \(countries[correctAnswer] == "uk" || countries[correctAnswer] == "us" ? "the \(countries[correctAnswer].uppercased())" : countries[correctAnswer].capitalized)?"
    }
    
    func newGame(action: UIAlertAction! = nil) {
        let ac = UIAlertController(title: "Get 10 flags right!", message: "Did you want to play?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "No, I dont.", style: .destructive, handler: playAnyway))
        ac.addAction(UIAlertAction(title: "Play", style: .default, handler: askQuestion))
        ac.addAction(UIAlertAction(title: "Play!", style: .default, handler: askQuestion))
        ac.addAction(UIAlertAction(title: "PLAYYYY!", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        score = 0
    }
    
    func playAnyway(action: UIAlertAction! = nil) {
        let ac = UIAlertController(title: "You dont want to play?", message: "Wow, okay.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "TOO BAD!", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    // Connect an action to an element on the Interface Builder
    // We must set the "tag" of each button to differentiate it from one another
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title: String
        
        // Check the answer
        if sender.tag == correctAnswer {
            title = "Correct"
            // adjust player score
            score += 1
            
            // Convert UIColor to cgColor with the property
            sender.layer.borderColor = UIColor.green.cgColor
        } else {
            // adjust player score
            if score == 5 {
                title = "Have you been guessing? Start over."
                score -= 5
                
                sender.layer.borderColor = UIColor.red.cgColor
            } else {
                if score == 0 {
                    title = "Nope! You chose \(countries[sender.tag] == "uk" || countries[sender.tag] == "us" ? "the \(countries[sender.tag].uppercased())" : countries[sender.tag].capitalized) instead of \(countries[correctAnswer] == "uk" || countries[correctAnswer] == "us" ? "the \(countries[correctAnswer].uppercased())" : countries[correctAnswer].capitalized)."
                    
                    // Convert UIColor to cgColor with the property
                    sender.layer.borderColor = UIColor.red.cgColor
                } else {
                    title = "Incorrect! You chose \(countries[sender.tag] == "uk" || countries[sender.tag] == "us" ? "the \(countries[sender.tag].uppercased())" : countries[sender.tag].capitalized) instead of \(countries[correctAnswer] == "uk" || countries[correctAnswer] == "us" ? "the \(countries[correctAnswer].uppercased())" : countries[correctAnswer].capitalized)."
                    score -= 1
                    
                    // Convert UIColor to cgColor with the property
                    sender.layer.borderColor = UIColor.red.cgColor
                }
            }
        }
        
        if score == 10 {
            // show score to player
            let ac = UIAlertController(title: "Well, you won.", message: "Question is...", preferredStyle: .alert)
            
            // the handler part of the code is looking for a closure which is just code that will be executed on button tap
            ac.addAction(UIAlertAction(title: "Play again?", style: .destructive, handler: newGame))
            
            // Send UIAlertController into the present method
            present(ac, animated: true)
        } else {
            // show score to player
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
            // the handler part of the code is looking for a closure which is just code that will be executed on button tap
            ac.addAction(UIAlertAction(title: "Continue!", style: .default, handler: askQuestion))
            ac.addAction(UIAlertAction(title: "End Game.", style: .destructive, handler: newGame))
            
            // Send UIAlertController into the present method
            present(ac, animated: true)
        }
    }
    

}

