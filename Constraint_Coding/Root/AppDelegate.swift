//
//  AppDelegate.swift
//  Constraint_Coding
//
//  Created by Islomjon on 29/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: MainVC())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

