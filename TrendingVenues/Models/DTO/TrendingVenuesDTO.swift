//
//  TrendingVenuesDTO.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import Foundation

struct TrendingVenuesDTO: Codable {
    let meta: MetaDataDTO
    let response: TrendingVenuesResponseDTO
}
    
struct MetaDataDTO: Codable {
    let code: Int
    let requestId: String
}

struct TrendingVenuesResponseDTO: Codable {
    let venues: [TrendingVenueDTO]
}

struct TrendingVenueDTO: Codable {
    let id: String
    let name: String
    let location: LocationDTO?
    let categories: [CategoryDTO]?
}

struct LocationDTO: Codable {
    let address: String?
    let crossStreet: String?
    let lat: Double?
    let lng: Double?
    let labeledLatLngs: [LabeledLatLngDTO]?
    let distance: Double?
    let postalCode: String?
    let cc: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]?
}

struct LabeledLatLngDTO: Codable {
    let label: String?
    let lat: Double?
    let lng: Double?
}

struct CategoryDTO: Codable {
    let id: String?
    let name: String?
    let pluralName: String?
    let shortName: String?
    let icon: IconDTO?
    let primary: Bool?
}

struct IconDTO: Codable {
    let prefix: String?
    let suffix: String?
}
