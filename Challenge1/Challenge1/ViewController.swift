//
//  ViewController.swift
//  Challenge1
//
//  Created by Jeremy on 5/25/22.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Edit navigation bar
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // Access files to load images in application
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // Iterate through flags and only append flags to the pictures array
        for item in items {
            if item.hasPrefix("flag") {
                pictures.append(item)
            }
        }
    }
    
    // Decide number of tableView rows by counting pictures array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // Load cell with information
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.imageView?.image = UIImage (named: "\(pictures[indexPath.row])")
        cell.imageView?.tintColor = .black
        return cell
    }
    
    // Dictate navigation for selected cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // Fullfill infomation for properties on DetailViewController
            vc.title = pictures[indexPath.row]
            vc.selectedImage = pictures[indexPath.row]
            
            // Move to the next view
            navigationController?.pushViewController(vc, animated: true)
        }
            
    }

}

