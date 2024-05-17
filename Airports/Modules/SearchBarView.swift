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
                    .font(.system(size: 50))
                    .bold()
                    .font(.largeTitle)
                Text("Finder")
                    .font(.system(size: 30))
                    .padding(.bottom, 60)
                
                TextField("Search...", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal,15)
                    .padding(.vertical,15)
                
                NavigationLink(destination: tabBar(query: text)) {
                    Text("Search")
                        .fontWeight(.semibold)
                        .fontDesign(.default)
                        .font(.system(size: 20))
                }
                
            }
            .offset(y: -30)
        }
        
    }
}
    
    #Preview {
        SearchBarView(text: "")
    }
    
    
