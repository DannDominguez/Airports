//
//  MapView.swift
//  Airports
//
//  Created by Daniela Ciciliano on 14/05/24.
//

import SwiftUI
import MapKit


struct tabBar: View {
   var query = ""
    
    var body: some View {
        TabView {
            tabBarMap(SearchText: query)
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            ListView(SearchText: query)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        } .background(Color.white)
    }
}

struct tabBarMap: View {
    @ObservedObject var airportsViewModel = AirportsViewModel()
    @State var SearchText = ""
    
    var body: some View {
        MapViewControllerBridge(viewModel: airportsViewModel)
            .onAppear {
                airportsViewModel.getAirports(Country: SearchText)
            }
    }
}

struct tabBarList: View {
    var body: some View {
        tabBar()
        
    }
}




//#Preview {
//    MapViewControllerBridge(viewModel: airportsViewModel)
//}
