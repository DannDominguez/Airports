//
//  RadiusViewModel.swift
//  Airports
//
//  Created by Daniela Ciciliano on 13/05/24.
//

import Foundation


class AirportsViewModel: ObservableObject {
    @Published var AirportsVM: [AirportsData]?
    @Published var error: Error?
    
    
    private let apiClient = APIClient()
    
    func getAirports(Country: String) {
        apiClient.getAirportsData(Country: Country) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let airports):
                    self.AirportsVM = airports
                    print("results \(airports)")
                case .failure(let error):
                    print("Error fetching search results: \(error)")
                }
            }
        }
        
    }
}






