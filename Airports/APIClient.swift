//
//  APIClient.swift
//  Airports
//
//  Created by Daniela Ciciliano on 13/05/24.
//

import Foundation


class APIClient {
    
    func getAirportsData (Country: String, completion: @escaping (Result<[AirportsData], Error>) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "X-RapidAPI-Host": "radarflight.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: URL(string: "https://radarflight.p.rapidapi.com/api/v1/airport/\(Country)")!,timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let result = try JSONDecoder().decode([AirportsData].self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON:\(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
