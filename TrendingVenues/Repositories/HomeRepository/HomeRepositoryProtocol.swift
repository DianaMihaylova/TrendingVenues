//
//  HomeRepositoryProtocol.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation

protocol HomeRepositoryProtocol {
    
    /// Gets the trending venues nearby
    func getTrendingVenues(lng: Double,
                           lat: Double,
                           limit: Int,
                           radius: Int,
                           dateString: String,
                           completion: @escaping (TrendingVenuesDTO?) -> Void)
    
}
