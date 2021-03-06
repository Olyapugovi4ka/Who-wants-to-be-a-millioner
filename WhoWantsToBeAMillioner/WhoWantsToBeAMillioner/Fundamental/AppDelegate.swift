//
//  AppDelegate.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 13.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Game.shared.addResults(RecordsCaretaker().loadResults())

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
      
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
  
    }
//    func applicationWillTerminate(_ application: UIApplication) {
//        <#code#>
//    }
//    func applicationDidFinishLaunching(_ application: UIApplication) {
//        Game.shared.addResults(RecordsCaretaker().loadResults())
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

