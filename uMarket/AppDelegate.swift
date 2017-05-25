//
//  AppDelegate.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 4/14/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        customizeUI()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    //MARK: - UI customization
    
    func customizeUI() {
        navigationBarAppearance()
    }
    
    func navigationBarAppearance() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor.mainColor()
        navigationBarAppearance.tintColor = UIColor.white
        navigationBarAppearance.isTranslucent = false
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName: UIFont(name: "Merriweather-Regular", size: 17)!]
    }
}

