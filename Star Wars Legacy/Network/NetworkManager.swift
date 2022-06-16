//
//  ServiceRequest.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 14/05/22.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    
    /*
    func fetchCharacters(_ url: String = "https://swapi.dev/api/people/?page=1", completionHandler: @escaping (GalaxyList) -> Void) {
        
        let url = URL(string: url)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let data = data, error == nil else { return }
                do {
                    let peopleJSON = try JSONDecoder().decode(GalaxyList.self, from: data)
                    
                    DispatchQueue.global(qos: .userInteractive).async {
                        completionHandler(peopleJSON)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
     */
    
    func fetchCharacters(_ url: String = "https://swapi.dev/api/people/?page=1") -> AnyPublisher<GalaxyList, Error> {
        
        let components = URLComponents(string: url)!
        
        let request = URLRequest(url: components.url!)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: GalaxyList.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

enum RequestInfo: String {
    case characters = "https://swapi.dev/api/people/?page=1"
}
