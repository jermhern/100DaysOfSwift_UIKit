//
//  ViewController.swift
//  Project5
//
//  Created by Jeremy on 5/29/22.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    @objc func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        
        // Reload all rows and sections from scratch for our tableView
        tableView.reloadData()
        
        let ac = UIAlertController(title: "Welcome!", message: "Guess words from the word on top, in this case \(title!)! They cannot be reused and must be larger than 2 letters.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Lets go!", style: .default))
        present(ac, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        // after 'in' is the body of the closure
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in // Specify the input into the closure. Using weak to destroy on completion
            guard let answer = ac?.textFields?[0].text else { return } // ac is optional as the input may not exist in the future
            self?.submit(answer) // self is optional as the input may not exist in the future
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    
                    // By inserting at pos 0 it puts the new word before any existing words in the array
                    usedWords.insert(lowerAnswer, at: 0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    // Tell the table view that a new word has been added to the array
                    // This improves animation instead of reloading the whole view
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    
                    // get out of the method, or else it would try to show the alert
                    return
                } else {
                    showErrorMessage(title: "Try Again!", message: "Word must be greater than 2 letters, a real word, and not copied from the challenge word.")
                }
            } else {
                showErrorMessage(title: "Already Used!", message: "You can't use the same word over again.")
            }
        } else {
            guard let title = title else { return }
            showErrorMessage(title: "What is that?", message: "You cant spell that word from \(title.lowercased())")
        }
    }
    
    func showErrorMessage(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        
        // Loop over all letters in the word
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                // Our word will shrink every time we evaluate it
                tempWord.remove(at: position)
            } else {
                // If we cannot find the letter in tempWord we return false
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        if word.count < 3 {
            return false
        } else if word == title {
            return false
        } else {
            let checker = UITextChecker()
            let range = NSRange(location: 0, length: word.utf16.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
            // Return if ANY mispelling was found in word
            return misspelledRange.location == NSNotFound
        }
    }

}

