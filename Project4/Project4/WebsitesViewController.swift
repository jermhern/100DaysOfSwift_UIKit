//
//  WebsitesViewController.swift
//  Project4
//
//  Created by Jeremy on 5/28/22.
//

import UIKit

class WebsitesViewController: UITableViewController {

    var websites = ["apple.com", "jermhern.carrd.co", "hackingwithswift.com", "glossier.com", "uniqlo.com", "swift.org", "spotify.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Navigate to your site"
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        cell.tintColor = .black
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as? ViewController {
            vc.website = websites[indexPath.row]
            vc.allowedWebsites = websites
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
