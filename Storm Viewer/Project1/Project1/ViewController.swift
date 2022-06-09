//
//  ViewController.swift
//  Project1
//
//  Created by Jeremy on 5/18/22.
//

import UIKit

// The ViewController inherits functionality from UITableViewController
class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black
            
        let fm = FileManager.default // FileManager lets us work with the file system
        let path = Bundle.main.resourcePath! // A bundle is a directory containing all of our assets and code
        let items = try! fm.contentsOfDirectory(atPath: path) // An array of names found in the resource directory
        
        for item in items { // All items found in the directory
            if item.hasPrefix("nssl") {
                // this is a picture to load
                pictures.append(item)
            }
        }
        
        // Sort images in the array to show in order
        pictures.sort()
    }
    
    // The parameters inside the methods decides what actually happens
    // This returns a number, the method numberOfRowsInSection describes what the function actually does
    // This code will be triggered by iOS when it wants to know how many rows are in the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This line allows cells to be recycled after leaving the screen to save CPU
        // We also already created
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.imageView?.image = UIImage (systemName: "photo")
        cell.imageView?.tintColor = UIColor.black
        // Send back the cell xcode is expecting
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.title = "Picture \(indexPath.row + 1) of \(pictures.count)"
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

