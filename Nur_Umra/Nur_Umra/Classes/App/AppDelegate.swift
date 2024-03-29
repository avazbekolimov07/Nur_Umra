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
        window?.backgroundColor = .white
        window?.rootViewController = HomeRouter.createModule()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDelegate enter background")
        NotificationCenter.default.post(name: Notification.Name("musicStopBackground"), object: nil)
    }
    
    


}

