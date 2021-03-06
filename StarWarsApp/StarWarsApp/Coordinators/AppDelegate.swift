//
//  AppDelegate.swift
//  StarWarsApp
//
//  Created by Alexander Ge on 8/30/18.
//  Copyright © 2018 G Dev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Setup Window
        let window = UIWindow()
        self.window = window
        
        // Show a duplicate of the loading screen on launch to perform all network requests before taking the user to the home page
        let storyboard = UIStoryboard(name: "LoadingViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
        controller.delegate = self
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate: LoadingViewControllerDelegate {
    func loadingViewControllerDidFinishLoading(films: [Film]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let sortedFilms = films.sorted(by: { dateFormatter.date(from: $0.releaseDate)! < dateFormatter.date(from: $1.releaseDate)! })
        
        let rootViewNavController = UINavigationController(rootViewController: HomeViewController(films: sortedFilms))
        rootViewNavController.navigationBar.isTranslucent = false
        
        window?.rootViewController = rootViewNavController
    }
}

