//
//  AppDelegate.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initializeRootVC()
        return true
    }
    
    /// set root view controller
    private func initializeRootVC() {
        let navbar = UINavigationController()
        let trendingMoviesVC = TrendingMoviesVC()
        navbar.viewControllers = [trendingMoviesVC]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navbar
        window?.makeKeyAndVisible()
    }

}

