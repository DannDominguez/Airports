//
//  RadiusView.swift
//  Airports
//
//  Created by Daniela Ciciliano on 13/05/24.
//

import SwiftUI

struct SearchBarView: View {
    @State var text: String
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Airports")
                    .bold()
                    .font(.largeTitle)
                Text("finder")
                
                TextField("Search...", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal,15)
                
                NavigationLink(destination: tabBar()) {
                    Text("Search")
                }
                
            }
        }
        
    }
}
    
    #Preview {
        SearchBarView(text: "")
    }
    
    
