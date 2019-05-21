//
//  MapViewController.swift
//  BeerMe
//
//  Created by Ian Koller on 5/12/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: MapViewModelProtocol
    let services = LocationServices()
    // MARK: - Initialization
    
    required init(viewModel: MapViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        preconditionFailure("You must use `init(viewModel:)")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        services.getLocationsFor(city: "Chicago") { result, error in
            
        }
        // Do any additional setup after loading the view.
    }
}
