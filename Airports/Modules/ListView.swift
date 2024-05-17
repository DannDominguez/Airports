//
//  ListView.swift
//  Airports
//
//  Created by Daniela Ciciliano on 14/05/24.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = AirportsViewModel()
    @State var SearchText = ""
    
    
    var body: some View {
        VStack {
            Text("**Airports**")
                .font(.system(size: 40, design: .default))
                .kerning(4)
                .padding(.top,20)
            Text("*Near to me*")
          
            Divider()
            
            List {
                ForEach(viewModel.AirportsVM ?? [], id: \.id) { item in
                    Text(item.name)
                }
                .listStyle(.plain)
            }.onAppear {
                viewModel.getAirports(Country: SearchText)
                    
            }
        }
    }
}

#Preview {
    ListView()
}
