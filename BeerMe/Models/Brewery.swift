//
//  Location.swift
//  BeerMe
//
//  Created by Ian Koller on 5/19/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import MapKit

struct Brewery: Codable {
    private enum CodingKeys: String, CodingKey {
        case rating
        case price
        case phone
        case id
        case reviewCount = "review_count"
        case name
        case url
        case location
        case coordinates
    }
    
    let rating: Double
    let price: String
    let phone: String
    let id: String
    let reviewCount: Int
    let name: String
    let url: URL
    let location: Location
    let coordinates: Coordinates
}

struct Location: Codable {
    private enum CodingKeys: String, CodingKey {
        case address1
        case city
        case state
        case zipCode = "zip_code"
    }
    
    let address1: String
    let city: String
    let state: String
    let zipCode: String
}

struct Coordinates: Codable {
    private enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    let latitude: Double
    let longitude: Double
}

struct BreweryResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case breweries = "businesses"
    }
    
    let breweries: [Brewery]
}
