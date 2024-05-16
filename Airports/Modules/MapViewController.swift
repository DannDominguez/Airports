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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
                view.addSubview(mapView)
                mapView.frame = view.bounds
       
    }
    
    func updateMap(with airports: [AirportsData]) {
//        mapView.removeAnnotations(mapView.annotations)
//        for airport in airports {
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = CLLocationCoordinate2D(latitude: airport.latitude, longitude: airport.longitude)
//            annotation.title = airport.name
//            mapView.addAnnotation(annotation)
//            }
            
         
        }
  
    
    }


struct MapViewControllerBridge: UIViewControllerRepresentable {
    //    @ObservedObject var viewModel: AirportsViewModel
    
    
    func makeUIViewController(context: Context) -> MapViewController {
        //        let mapViewController = MapViewController()
        //                mapViewController.viewModel = viewModel
        //
        return MapViewController()
        
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        //        guard let airports = viewModel.AirportsVM else { return }
        //                uiViewController.updateMap(with: airports)
        //            }
    }
    
}
    typealias UIViewControllerType = MapViewController
    
    

