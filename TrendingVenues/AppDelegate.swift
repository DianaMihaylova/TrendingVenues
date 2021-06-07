//
//  AppDelegate.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    var apiManager: ApiManagerProtocol = APIManager.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        setupAppCoordinator(withWindow: window)
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    private func setupAppCoordinator(withWindow window: UIWindow?) {
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }

}

