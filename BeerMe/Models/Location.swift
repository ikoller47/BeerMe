//
//  Location.swift
//  BeerMe
//
//  Created by Ian Koller on 5/19/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

class Location: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case breweryType = "brewery_type"
        case street
        case city
        case state
        case zip = "postal_code"
        case country
        case phoneNumber = "phone"
        case website = "website_url"
    }
    
    let id: Int
    let name: String
    let breweryType: String
    let street: String
    let city: String
    let state: String
    let zip: String
    let country: String
    let phoneNumber: String
    let website: String
}
