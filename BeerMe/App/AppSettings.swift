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
        servicesURL: "http://beermapping.com/webservice/",
        servicesAPIKey: "629cb39d0060a5a1e1c160871ada30dd"
    )
}
