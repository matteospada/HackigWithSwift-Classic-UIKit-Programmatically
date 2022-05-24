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
        let secondVC = ViewController()
        
        firstVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "VC1")
        firstVC.tabBarItem.tag = 0
        secondVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        secondVC.tabBarItem.tag = 1
        
        let firstNav = UINavigationController(rootViewController: firstVC)
        
        let secondNav = UINavigationController(rootViewController: secondVC)
        
        let tabBarList = [firstNav, secondNav]
        
        viewControllers = tabBarList
        
    }
    
    
    
}
