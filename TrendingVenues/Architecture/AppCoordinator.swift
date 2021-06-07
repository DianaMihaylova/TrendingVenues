//
//  AppCoordinator.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: Properties
    var navigationController: UINavigationController
    let window: UIWindow?
    
    // MARK: Coordinator
    init(window: UIWindow?) {
        self.window = window
        navigationController = UINavigationController()
        super.init()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    override func start() {
        let movieCoordinator = TrendingVenuesCoordinator(navigationController: navigationController)
        addChildCoordinator(movieCoordinator)
        movieCoordinator.start()
    }
    
}
