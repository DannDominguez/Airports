//
//  APIClient.swift
//  Airports
//
//  Created by Daniela Ciciliano on 13/05/24.
//

import Foundation


class APIClient {
    
    
    func getData (completion: @escaping (Result<Data, Error>) -> Void) {
       
        let headers = [
            "X-RapidAPI-Key": "d7b4708509msh6675f58eb66caadp182309jsn2e6e7156ee4e",
            "X-RapidAPI-Host": "airports-finder1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://airports-finder1.p.rapidapi.com/airports/coordinates/32.9222/-97.0409")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        }).resume()
        
        
    }
}

