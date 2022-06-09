//
//  DetailViewController.swift
//  Project7
//
//  Created by Jeremy on 6/5/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let detailItem = detailItem else { return }
        let html = """
        <html>
        <head>
        <meta name ="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; padding: 25px; } </style>
        </head>
        <body>
        <font face = "helvetica">
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showCredit))
        
    }
    
    @objc func showCredit() {
        let ac = UIAlertController(title: "Credit", message: "Data is from: \(detailItem?.url ?? "https://petitions.whitehouse.gov")", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Close", style: .destructive))
        present(ac, animated: true)
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
