//
//  AppDelegate.swift
//  Project2
//
//  Created by Matteo Spada on 22/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let nav = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = nav
        
        return true
    }


}

