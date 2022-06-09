//
//  ViewController.swift
//  Project4
//
//  Created by Jeremy on 5/26/22.
//

import UIKit
import WebKit

// Our viewcontroller class extends UIViewController and takes the delegation of WKNavigaiton
class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var website: String!
    var allowedWebsites: [String]!
    
    override func loadView() {
        webView = WKWebView()
        // Delegation : a programming pattern.
        // A delegate is one thing acting in place of another
        // All navigationDelegate protocols are optional
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(openHome))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        // Create a flexible space
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // Call reload & navigation methods
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let navForward = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))
        let navBackward = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))
        
        toolbarItems = [progressButton, spacer, navBackward, navForward, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        let url = URL(string: "https://" + website)!
        
        // who the observer is, what property we want to observe, what value we want, and a context value
        // forKeyPath allows the ocmpiler to check if the code is correct
        // Context value gets sent back to us when the value has changed
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        // Wrap out URL in a URLRequest
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.allowsLinkPreview = true
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    // This is an escaping closure, meaning you can use it at a later date
    // This will only allow users to go to certain sites that we have specified
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if let host = url?.host {
            for website in allowedWebsites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        // Dissallow website loading
        decisionHandler(.cancel)
        
        // Show alert when user attemps to load blocked site
        let ac = UIAlertController(title: "Warning", message: "\(url?.description ?? "Current site") has not been approved.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .destructive))
        present(ac, animated: true)
        
        return

    }
    
}

