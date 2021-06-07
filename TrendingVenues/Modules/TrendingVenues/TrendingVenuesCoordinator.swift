//
//  TrendingVenuesCoordinator.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import UIKit

class TrendingVenuesCoordinator: Coordinator {
    
    unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewController = TrendingVenuesSceneFactory.createTrendingVenuesHomeScene(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - TrendingVenuesHomeCoordinatorDelegate
extension TrendingVenuesCoordinator: TrendingVenuesHomeCoordinatorDelegate {
    
    func continueWithDetails(with trendingVenue: TrendingVenueDTO) {
        let viewController = TrendingVenuesSceneFactory.createTrendingVenueDetailsScene(trendingVenue: trendingVenue)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
