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
    
    let session = URLSession.shared
    
    func fetchCharacters(_ url: String) -> AnyPublisher<GalaxyList, Error> {
        
        let components = URLComponents(string: url)!
        
        let request = URLRequest(url: components.url!)
         
        return session.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: GalaxyList.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    func fetchImages(_ id: String) {
        
        var baseUrl = "https://starwars-visualguide.com/assets/img/characters/$id.jpg"
        
        let components = URLComponents(string: baseUrl.replacingOccurrences(of: "$id", with: id))!
        
        let request = URLRequest(url: components.url!)
        
        
        
    }
    
    
}
