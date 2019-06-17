//
//  Localizable.swift
//  BeerMe
//
//  Created by Ian Koller on 6/11/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    var localized: String {
        return NSLocalizedString(self.rawValue, tableName: nil, bundle: .main, value: self.rawValue, comment: "")
    }
}
