//
//  MainViewController.swift
//  Project7
//
//  Created by Matteo Spada on 23/05/22.
//

import Foundation
import UIKit


class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = ViewController()
        let secondVC = ViewController2()
        
        firstVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "VC1")
        
        secondVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        let firstNav = UINavigationController(rootViewController: firstVC)
        
        let secondNav = UINavigationController(rootViewController: secondVC)
        
        let tabBarList = [firstNav, secondNav]
        
        viewControllers = tabBarList
        
    }
    
    
    
}
