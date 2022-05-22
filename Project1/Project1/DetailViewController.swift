//
//  DetailScreen.swift
//  Project1
//
//  Created by Matteo Spada on 22/05/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    
    var selectedImage: String?
    var index: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pictures: \(index!)"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
        
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    
    
    
    func setup() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 400)
        ])
        
    }
    
}
