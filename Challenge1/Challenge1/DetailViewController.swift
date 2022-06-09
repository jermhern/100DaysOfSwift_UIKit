//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Jeremy on 5/25/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title is optional because it is nil by default
        let navBar = self.navigationController?.navigationBar
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        navBar?.tintColor = .black
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = standardAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        navigationController?.navigationBar.prefersLargeTitles = false
                
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    @objc func shareFlag() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No photo found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, "What a flag! Check out Flag Viewer today!"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
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
