//
//  MapDetailsViewController.swift
//  StarbucksCCH
//
//  Created by Silvio Bulla on 27/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import UIKit
import MapKit

class MapDetailsViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var place: Place!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.title = place.name
        setUpMap()
    }
    
    func setUpMap(){
        let latitude = place.geometry.location.lat
        let longitude = place.geometry.location.lng
        let starbuckLocation = CLLocation(latitude: latitude, longitude: longitude)
        centerMapOnLocation(location: starbuckLocation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        addAnnotation(location: location)
    }
    
    func addAnnotation(location: CLLocation){
        let annotation = MKPointAnnotation()
        let location2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        annotation.coordinate = location2D
        annotation.title = place.name
        annotation.subtitle = place.formatted_address
        mapView.addAnnotation(annotation)
    }

}
