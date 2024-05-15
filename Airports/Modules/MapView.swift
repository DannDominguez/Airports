//
//  MapView.swift
//  Airports
//
//  Created by Daniela Ciciliano on 14/05/24.
//

import SwiftUI
import MapKit



struct MapView: UIViewRepresentable {

    
    @ObservedObject var viewModel = AirportsViewModel()
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
    }
        
        func makeUIView(context: Context) -> MKMapView {
            MKMapView(frame: .zero)
        }
        
    }
    
    struct tabBar: View {
        var body: some View {
            TabView {
                tabBarMap()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
            }
        }
    }
    
    struct tabBarMap: View {
        var viewModel = AirportsViewModel()
        @State private var SearchText = ""
        
        var body: some View {
            MapView()
                .onAppear {
                    viewModel.getAirports(query: SearchText)
                }
        }
    }
    struct tabBarList: View {
        var body: some View {
            tabBar()
            
        }
    }
    


#Preview {
    MapView()
}
