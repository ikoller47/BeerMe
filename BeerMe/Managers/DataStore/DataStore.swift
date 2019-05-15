//
//  DataStore.swift
//  BeerMe
//
//  Created by Ian Koller on 5/14/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

class DataStore {
    
    // MARK: - Properties
    
    private let userDefaults: UserDefaults
    private let jsonEncoder: JSONEncoder
    private let jsonDecoder: JSONDecoder
    
    // MARK: - Initialization
    
    init(jsonEncoder: JSONEncoder = JSONEncoder(), jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonEncoder = jsonEncoder
        self.jsonDecoder = jsonDecoder
        self.userDefaults = UserDefaults.standard
    }
    
    func write<T: Codable>(model: T, forKey key: String) {
        if let encoded = try? jsonEncoder.encode(model) {
            userDefaults.set(encoded, forKey: key)
        }
    }
    
    func read<T: Codable>(key: String) -> T? {
        if let savedObject = userDefaults.object(forKey: key) as? Data {
            if let loadedObject = try? jsonDecoder.decode(T.self, from: savedObject) {
                return loadedObject
            }
        }
        
        return nil
    }
}
