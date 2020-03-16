//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Luca Stanger on 11.03.20.
//  Copyright © 2020 Luca Stanger. All rights reserved.
//

//import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var viewContainer: UIView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var locationButton: UIButton!
    @IBOutlet var pinButton: UIButton!
    
    let locationManager = CLLocationManager()
    var locations = [MKPointAnnotation]()
    var location: CLLocation!
    var locationIndex: Int = 0
    
    override func loadView() {
        // Warum loadView aufrufen?!??!?!?!
        super.loadView()
        
        // let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybird", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)

        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)

        let margins = view.layoutMarginsGuide

        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    
    }
    
    override func viewDidLoad() {
        print("MapViewController loaded its value")
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       self.location = locations.last as CLLocation?
    }
    
    @IBAction func findMyLocation(_ sender: Any) {
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: center, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
    @IBAction func findMyPins(_ sender: Any) {
        // Gold Coding Challenge
        let birthlocation = MKPointAnnotation()
        birthlocation.title = "Birthlocation"
        birthlocation.coordinate = CLLocationCoordinate2D(latitude: 48.957054, longitude: 9.135297)
            
        let homelocation = MKPointAnnotation()
        homelocation.title = "Home"
        homelocation.coordinate = CLLocationCoordinate2D(latitude: 48.927282, longitude: 9.185378)
        
        let currentLocation = MKPointAnnotation()
        currentLocation.title = "Current Location"
        // Geht nicht außerhalb der Funktion?!
        currentLocation.coordinate = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
    
        locations.append(birthlocation)
        locations.append(homelocation)
        locations.append(currentLocation)
        
        for annotation in locations {
            mapView.addAnnotation(annotation)
        }
        
        nextPin()
        
    }
    
    func nextPin() {

        let center = locations[locationIndex].coordinate
        
        if (locationIndex == 2) {
            locationIndex = 0
        } else {
            locationIndex = locationIndex + 1
        }
        
        let span = MKCoordinateSpan.init(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: center, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // Silver Coding Challenge
        if (self.overrideUserInterfaceStyle == .dark) {
            self.overrideUserInterfaceStyle = .light
        } else {
            self.overrideUserInterfaceStyle = .dark
        }
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}
