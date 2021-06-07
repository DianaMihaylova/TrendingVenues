//
//  TrendingVenuesSceneFactory.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import UIKit

class TrendingVenuesSceneFactory {
    
    static func createTrendingVenuesHomeScene(coordinator: TrendingVenuesHomeCoordinatorDelegate) -> BaseViewController {
        let viewModel = TrendingVenuesHomeViewModel(coordinator: coordinator,
                                                    repository: HomeRepository())
        let viewController = TrendingVenuesHomeViewController.makeViewController(withViewModel: viewModel)
        return viewController
    }
    
    static func createTrendingVenueDetailsScene(trendingVenue: TrendingVenueDTO) -> BaseViewController {
        let viewModel = TrendingVenueDetailsViewModel(trendingVenue: trendingVenue)
        let viewController = TrendingVenueDetailsViewController.makeViewController(withViewModel: viewModel)
        return viewController
    }
    
}

