//
//  MapViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 5/12/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import CoreLocation
import Bond
import UIKit

protocol MapViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var locations: Observable<[LocationViewModel]?> { get }
    var currentLocation: Observable<CLLocation?> { get }
    var title: String { get }
    
    func callButtonPressed(model: LocationViewModel)
    func websiteButtonPressed(model: LocationViewModel)
}

class MapViewModel: MapViewModelProtocol {
    
    // MARK: - Properties
    
    private let breweryManager: BreweryManager
    private let locationManager: LocationManager
    private let coordinator: MapCoordinatorProtocol
    
    let isLoading = Observable<Bool>(false)
    let locations = Observable<[LocationViewModel]?>(nil)
    let currentLocation = Observable<CLLocation?>(nil)
    let title: String
    
    // MARK: Initialization
    
    init(breweryManager: BreweryManager, locationManager: LocationManager, coordinator: MapCoordinatorProtocol) {
        self.breweryManager = breweryManager
        self.locationManager = locationManager
        self.coordinator = coordinator
        self.title = "Beer Me"
        
        NotificationCenter.default.addObserver(self, selector: #selector(getLocations), name: .didUpdateLocation, object: locationManager)
    }
    
    func callButtonPressed(model: LocationViewModel) {
        guard let phoneURL = URL(string: "tel://\(model.phone)") else {
            return
        }
        
        UIApplication.shared.open(phoneURL)
    }
    
    func websiteButtonPressed(model: LocationViewModel) {
        UIApplication.shared.tryURL(urls: [model.url])
    }
    
    @objc private func getLocations() {
        guard let location = locationManager.currentLocation else {
            return
        }
        
        currentLocation.value = location
        isLoading.value = true
        
        breweryManager.getLocationsFor(lat: location.coordinate.latitude, long: location.coordinate.longitude){ response, error in
            self.isLoading.value = false
            
            if let error = error {
                print(error)
            } else if let response = response {
                self.locations.value = response.breweries.map ({ (location) -> LocationViewModel in
                    LocationViewModel(model: location, coordinator: self.coordinator)
                })
            }
        }
    }
}
