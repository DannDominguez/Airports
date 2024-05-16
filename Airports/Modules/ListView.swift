//
//  ListView.swift
//  Airports
//
//  Created by Daniela Ciciliano on 14/05/24.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = AirportsViewModel()
    var SearchText = ""
    
    var body: some View {
        List {
            ForEach(viewModel.AirportsVM ?? [], id: \.id) { item in
                Text(item.name)
            }
        }.onAppear {
            viewModel.getAirports(Country: SearchText)
        }
    }
}


#Preview {
    ListView()
}
