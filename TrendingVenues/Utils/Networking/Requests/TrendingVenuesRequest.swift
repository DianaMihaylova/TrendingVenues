//
//  TrendingVenuesRequest.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation

class TrendingVenuesRequest: BaseAPIRequest {
    
    override var version: String {
        return "2"
    }
    
    override var path: String {
        return "venues/trending"
    }

}
