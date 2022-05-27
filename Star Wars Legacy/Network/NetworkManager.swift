//
//  ServiceRequest.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 14/05/22.
//

import Foundation

class NetworkManager {
    
    func fetchPeople(_ url: String = "https://swapi.dev/api/people/?page=1", completionHandler: @escaping (GalaxyList) -> Void) {
        
        let url = URL(string: url)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                
                guard let data = data else { return }
                
                do {
                    let peopleJSON = try JSONDecoder().decode(GalaxyList.self, from: data)
                    
                    DispatchQueue.global(qos: .userInteractive).async {
                        completionHandler(peopleJSON)
                    }
                    
                } catch {
                    
                }
            }
        }.resume()
    }
}

enum RequestInfo: String {
    case characters = "https://swapi.dev/api/people/?page=1"
}
