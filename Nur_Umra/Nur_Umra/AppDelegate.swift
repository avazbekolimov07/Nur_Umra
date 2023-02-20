//
//  AppDelegate.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 20/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        let vc = MainVC()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

  


}

