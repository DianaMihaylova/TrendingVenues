//
//  TrendingVenueDetailsViewModelProtocol.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation

/// View delegate
protocol TrendingVenueDetailsViewDelegate: class {
    
    func set(urlString: String, name: String, address: String)
    
}

protocol TrendingVenueDetailsViewModelProtocol: CoordinatableViewModel {
    
    var delegate: TrendingVenueDetailsViewDelegate? { get set }
    
}

