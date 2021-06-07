//
//  TrendingVenueDetailsViewModel.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation

class TrendingVenueDetailsViewModel: TrendingVenueDetailsViewModelProtocol {
    
    // MARK: - Properties
    weak var delegate: TrendingVenueDetailsViewDelegate?
    private var trendingVenue: TrendingVenueDTO
    
    // MARK: - View model
    init(trendingVenue: TrendingVenueDTO) {
        self.trendingVenue = trendingVenue
    }
    
    // MARK: - CoordinatableViewModel
    func start() {
        delegate?.set(urlString: urlString(from: trendingVenue.categories?.first),
                      name: trendingVenue.name,
                      address: address(from: trendingVenue.location))
    }
    
    // MARK: - Private
    private func urlString(from category: CategoryDTO?) -> String {
        guard let category = category,
              let iconPrefix = category.icon?.prefix,
              let iconSuffix = category.icon?.suffix else { return "" }
        return "\(iconPrefix)88\(iconSuffix)"
    }
    
    private func address(from location: LocationDTO?) -> String {
        guard let location = location else { return "" }
        var address = ""
        location.formattedAddress?.forEach { text in
            address.append("\(text)\n")
        }
        return address
    }
   
}
