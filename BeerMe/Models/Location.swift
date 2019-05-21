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
        case status
        case reviewLink = "reviewlink"
        case proxyLink = "proxylink"
        case blogMap = "blogmap"
        case street
        case city
        case state
        case zip
        case country
        case phoneNumber = "phone"
        case website = "url"
        case rating = "overall"
        case imageCount = "imagecount"
    }
    
    let id: Int
    let name: String
    let status: String
    let reviewLink: URL
    let proxyLink: URL
    let blogMap: URL
    let street: String
    let city: String
    let state: String
    let zip: String
    let country: String
    let phoneNumber: String
    let website: URL
    let rating: Double
    let imageCount: Int
}
