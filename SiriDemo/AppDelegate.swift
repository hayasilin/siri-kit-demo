//
//  AppDelegate.swift
//  SiriDemo
//
//  Created by kuanwei on 2020/9/22.
//  Copyright © 2020 kuanwei. All rights reserved.
//

import UIKit
import Intents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var nav: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        nav = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()

        return true
    }

    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        if userActivityType == "com.sirilab.PersonInfo" {
            return true
        }
        return false
    }

    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        if userActivity.interaction?.intent is PersonInfoIntent {
            let vc = DetailViewController()
            nav?.pushViewController(vc, animated: true)
        } else if userActivity.interaction?.intent is ToDoIntent {
            print("ToDoIntent")
        }
        return true
    }
}
