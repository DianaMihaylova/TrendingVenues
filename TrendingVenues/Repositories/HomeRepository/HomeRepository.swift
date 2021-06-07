//
//  HomeRepository.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation

class HomeRepository: HomeRepositoryProtocol {
    
    func getTrendingVenues(lng: Double,
                           lat: Double,
                           limit: Int,
                           radius: Int,
                           dateString: String,
                           completion: @escaping (TrendingVenuesDTO?) -> Void) {
        let queryParams: [String: String] = [
            "client_id": Constants.clientId,
            "client_secret": Constants.clientSecret,
            "v": "\(dateString)",
            "ll": "\(lng),\(lat)",
            "limit": "\(limit)",
            "radius": "\(radius)"
        ]
        TrendingVenuesRequest(queryParameters: queryParams).executeParsed(of: TrendingVenuesDTO.self) { data, _, _ in
            completion(data)
        }
    }
    
}


