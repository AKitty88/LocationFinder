//
//  ViewController.swift
//  LocationFinder
//
//  Created by User on 24/1/2023.
//

import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate {
    let mapView = MKMapView()
    var locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        
        ])
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        print(location.coordinate)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 0.01, longitudinalMeters: 0.01)
        
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
}

