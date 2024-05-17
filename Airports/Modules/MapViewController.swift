//
//  MapViewController.swift
//  Airports
//
//  Created by Daniela Ciciliano on 15/05/24.
//

import UIKit
import SwiftUI
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var mapView = MKMapView()
    @ObservedObject var viewModel = AirportsViewModel()
    var airportsInMap: [AirportsData]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        view.addSubview(mapView)
        mapView.frame = view.bounds
        let initialRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.64031, longitude: -99.09754), span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06))
        mapView.setRegion(initialRegion, animated: true)
     
        addAnnotatios()
    }
    
    func addAnnotatios() {
        guard let airports = airportsInMap else {
            return
        }
        //        mapView.removeAnnotations(mapView.annotations)
        for airport in airports {
            guard let latitude = Double(airport.latitudeDege), let longitude = Double(airport.longitudeDeg) else {
                continue
            }
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation.title = airport.name
            
            mapView.addAnnotation(annotation)
        }
        
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    
}


struct MapViewControllerBridge: UIViewControllerRepresentable {
    var viewModel: AirportsViewModel
    var mapView = MapViewController()
    
    
    func makeUIViewController(context: Context) -> MapViewController {
        mapView.airportsInMap = viewModel.AirportsVM
        return mapView
        
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
       
        uiViewController.airportsInMap = viewModel.AirportsVM
        uiViewController.addAnnotatios()
        
    }
    
}
typealias UIViewControllerType = MapViewController



