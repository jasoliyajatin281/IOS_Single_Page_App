//
//  SecondViewController.swift
//  Assignment3
//
//  Created by Student on 2019-08-13.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import MapKit


class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    
    }
}

class SecondViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sourceLocation = CLLocationCoordinate2D(latitude:21.1205 , longitude: 72.7431)
        let destinationLocation = CLLocationCoordinate2D(latitude: 21.224352, longitude: 72.799530)
        
        let beachLocation =  CLLocationCoordinate2D(latitude: 21.087060, longitude: 72.723700)
         let hotelLocation =  CLLocationCoordinate2D(latitude: 21.1360, longitude: 72.7511)
        
        
        let sourcePin = customPin(pinTitle: "Surat Airport", pinSubTitle: "", location: sourceLocation)
        let destinationPin = customPin(pinTitle: "Home", pinSubTitle: "", location: destinationLocation)
        
        let region = MKCoordinateRegion(center: beachLocation, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
        let hotelRegion = MKCoordinateRegion(center: hotelLocation, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
        self.mapView.setRegion(region, animated: true)
        self.mapView.setRegion(hotelRegion, animated: true)
        let pin = customPin(pinTitle: "Dumas Beach", pinSubTitle: "Dumas Beach, Surat, India", location: beachLocation)
        let hotelPin = customPin(pinTitle: "The Grand Bhagvati Hotel", pinSubTitle: "The Grand Bhagvati Hotel, Near airport, Surat, India", location: hotelLocation)
        
        
        self.mapView.addAnnotation(sourcePin)
        self.mapView.addAnnotation(destinationPin)
        self.mapView.addAnnotation(pin)
         self.mapView.addAnnotation(hotelPin)
        
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        direction.calculate { (response, error) in
            guard let directionResponse = response else {
                if let error = error {
                    print("we have error getting direction == \(error.localizedDescription)")
                    
                }
                
                return
            }
            
            let route = directionResponse.routes[0]
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            
        }
        
        self.mapView.delegate = self
        
        
    }
   
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }

}

