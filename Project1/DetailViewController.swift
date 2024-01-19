//
//  DetailViewController.swift
//  Project1
//
//  Created by Zeeshan Waheed on 16/01/2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?

    var pictures = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is picture to load
                pictures.append(item)
            }
        }
        
        let sorted_Picture = pictures.sorted()
        
        var num: Int = 0
        
        func detail() -> String {
            for images in sorted_Picture {
                num += 1
                if images == selectedImage {
                    return "Picture \(num) of \(sorted_Picture.count)"
                }
            }
            return ""
        }
        
        title = detail()
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
