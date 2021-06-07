//
//  TrendingVenuesHomeViewModelProtocol.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import Foundation

/// Coordination delegate
protocol TrendingVenuesHomeCoordinatorDelegate: class {
    
    func continueWithDetails(with trendingVenue: TrendingVenueDTO)
    
}

/// View delegate
protocol TrendingVenuesHomeViewDelegate: class {
    
    func reloadData()
    func activateIndicator(_ shouldActivate: Bool)
    func setEmptyDataText(_ text: String)
    
}

protocol TrendingVenuesHomeViewModelProtocol: CoordinatableViewModel, BaseDataSource {
    
    var delegate: TrendingVenuesHomeViewDelegate? { get set }
    
    func search(with text: String)
    
}
