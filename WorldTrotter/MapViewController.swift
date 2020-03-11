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

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        print("MapViewController loaded its view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Silver Coding Challenge
        if (self.overrideUserInterfaceStyle == .dark) {
            self.overrideUserInterfaceStyle = .light
        } else {
            self.overrideUserInterfaceStyle = .dark
        }
    }
}
