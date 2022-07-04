//
//  ServiceRequest.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 14/05/22.
//

import Foundation
import Combine
import SwiftUI

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchCharacters(_ url: String) -> AnyPublisher<GalaxyList, Error> {
        return execute(url, dataType: GalaxyList.self)
    }
    
    func fetchImages(_ url: String) -> AnyPublisher<Images, Error> {
        return execute(url, dataType: Images.self)
    }
    
    func fetchPlanets(_ url: String) -> AnyPublisher<Planets, Error> {
        return execute(url, dataType: Planets.self)
    }
    
    private func execute<Element: Decodable>(_ url: String, dataType: Element.Type) -> AnyPublisher<Element, Error> {
        
        let components = URLComponents(string: url)!
        
        let request = URLRequest(url: components.url!)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: dataType.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
