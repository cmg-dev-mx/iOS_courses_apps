//
//  AppDelegate.swift
//  iOS-Calculator
//
//  Created by Cesar Morales Garduño on 5/19/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupView()
        return true
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        window = UIWindow(frame: UIScreen.main.bounds)

        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }    
}
