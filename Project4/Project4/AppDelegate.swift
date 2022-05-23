//
//  AppDelegate.swift
//  Project4
//
//  Created by Matteo Spada on 23/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        
        let nav = UINavigationController(rootViewController: SelectorViewController())
        
        window?.rootViewController = nav
        
        // Override point for customization after application launch.
        return true
    }




}

