//
//  ViewController.swift
//  Challenge2
//
//  Created by Jeremy on 6/3/22.
//

import UIKit

class ViewController: UITableViewController {

    var list = [String]()
    
    override func viewDidLoad() {
        let refreshControl = UIRefreshControl()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToAdd(_:)), for: .allEvents)
        refreshControl.tintColor = .darkGray
        
        title = "Lazy List: \(Date.now.formatted(date: .abbreviated, time: .omitted))"
        overrideUserInterfaceStyle = .light
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(newList))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newItem))
        navigationController?.navigationBar.tintColor = .black

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    @objc func pullToAdd(_ sender: Any) {
        newItem()
    }
    
    @objc func newList() {
        list.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func newItem() {
        let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submission = UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else { return }
            self?.submit(item)
        }

        ac.addAction(submission)
        ac.addAction(UIAlertAction(title: "Cancel", style: .destructive))

        present(ac, animated: true)
    }
    
    func submit(_ item: String) {
        // Show an alert closure if there is no text
        if item.isEmpty {
            let ac = UIAlertController(title: "Error", message: "There wasnt any item present.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Close", style: .destructive))
            present(ac, animated: true)
            
            tableView.refreshControl?.endRefreshing()
        } else {
            // Add the grocery item to the item array
            list.insert(item.capitalized, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            
            tableView.refreshControl?.endRefreshing()

            return
        }
    }

}

