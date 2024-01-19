//
//  ViewController.swift
//  Project1
//
//  Created by Zeeshan Waheed on 14/01/2024.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // built in system type that lets us work with the file system
        // using to look for files
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is picture to load
                pictures.append(item)
            }
        }
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortedPictures = pictures.sorted()
        return sortedPictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let sortedPictures = pictures.sorted()
        cell.textLabel?.text = sortedPictures[indexPath.row]
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // selecting DetailViewController using typecasting
        if let vc = storyboard?.instantiateViewController(withIdentifier:"Detail") as? DetailViewController {
            let sortedPictures = pictures.sorted()
            vc.selectedImage = sortedPictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

