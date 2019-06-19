//
//  MapViewController.swift
//  BeerMe
//
//  Created by Ian Koller on 5/12/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var detailView: UIView!
    @IBOutlet private weak var breweryNameLabel: UILabel!
    @IBOutlet private weak var breweryAddress1Label: UILabel!
    @IBOutlet private weak var breweryAddress2Label: UILabel!
    @IBOutlet private weak var callButton: UIButton!
    @IBOutlet private weak var websiteButton: UIButton!
    @IBOutlet weak var detailViewConstraint: NSLayoutConstraint!
    
    // MARK: - Outlet Collection
    
    @IBOutlet private var detailButtons: [UIButton]!
    
    // MARK: - Properties
    
    private let viewModel: MapViewModelProtocol
    private var currentPosition: OverlayPosition = .hidden
    private var currentSelection: LocationViewModel?
    
    private enum OverlayPosition {
        case visible
        case hidden
    }

    // MARK: - Initialization
    
    required init(viewModel: MapViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        bindViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        preconditionFailure("You must use `init(viewModel:)")
    }
    
    // MARK: - Binding
    
    func bindViewModel() {
        _ = viewModel.locations.observeNext {
            $0?.forEach { self.mapView.addAnnotation($0)}
        }
        _ = viewModel.currentLocation.observeNext {
            guard let coordinate = $0?.coordinate else {
                return
            }
            
            let viewRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            self.mapView.setRegion(viewRegion, animated: false)
            self.mapView.showsUserLocation = true
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.title
        
        callButton.setTitle(BeerMeStrings.call.localized, for: .normal)
        websiteButton.setTitle(BeerMeStrings.website.localized, for: .normal)
        
        detailButtons.forEach {
            $0.backgroundColor = .navigationBarText
            $0.layer.cornerRadius = $0.frame.width * 0.1
        }
    }
    
    // MARK: - Actions
    
    @IBAction func callButtonPressed(_ sender: Any) {
        guard let model = currentSelection else {
            return
        }
        
        viewModel.callButtonPressed(model: model)
    }
    
    @IBAction func websiteButtonPressed(_ sender: Any) {
        guard let model = currentSelection else {
            return
        }
        
        viewModel.websiteButtonPressed(model: model)
    }
    
    // MARK: - Show/Hide Detail View
    
    func showDetail(withModel model: LocationViewModel) {
        breweryNameLabel.text = model.name
        breweryAddress1Label.text = model.address1
        breweryAddress2Label.text = model.cityStateZip
        
        if currentPosition == .hidden {
            toggleDetailVisibility()
            currentPosition = .visible
        }
    }
    
    func hideDetail() {
        if currentPosition == .visible {
            toggleDetailVisibility()
            currentPosition = .hidden
        }
    }
    
    private func toggleDetailVisibility() {
        let positionChange: CGFloat = currentPosition == .hidden ? -150.0 : 150
        self.detailViewConstraint.constant += positionChange
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let viewModel = annotation as? LocationViewModel else {
            return nil
        }
        
        let identifier = "brewery"
        let annotationView: MKAnnotationView
        
        if let existingView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            annotationView = existingView
        } else {
            annotationView = MKAnnotationView(annotation: viewModel, reuseIdentifier: identifier)
        }
        
        annotationView.image = viewModel.image
        annotationView.frame.size = CGSize(width: 40.0, height: 40.0)
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let model = view.annotation as? LocationViewModel else {
            return
        }
        
        currentSelection = model
        showDetail(withModel: model)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        currentSelection = nil
        hideDetail()
    }
}
