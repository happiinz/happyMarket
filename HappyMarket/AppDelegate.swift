//
//  AppDelegate.swift
//  HappyMarket
//
//  Created by Pratchaya Yordming on 30/7/2564 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        print("Widgets did open to \"\(url.absoluteString)\"")
        
        let page = url.absoluteString.replacingOccurrences(of: "urlsceheme://", with: "")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "performDeeplink"),
                                        object: nil,
                                        userInfo: ["page": page])
        
        return true
    }
}

