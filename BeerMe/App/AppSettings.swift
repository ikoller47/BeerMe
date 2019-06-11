//
//  AppSettings.swift
//  BeerMe
//
//  Created by Ian Koller on 5/19/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

struct AppSettings {
    let servicesURL: String
    let servicesAPIKey: String
    
    static var production = AppSettings(
        servicesURL: "https://api.yelp.com/v3/",
        servicesAPIKey:"xdBoN7Iz3fSPGBzWkSZzb9HV5E4Rxh8DK7Hmp2q7aKcJnArl-HBG53IzzBHHn951AcXKin3jaa_jaFfkN0LiIoI6vboiGUpRnpV1qdJXvS5P9agHaGKQD08x86DtXHYx"
    )
}
