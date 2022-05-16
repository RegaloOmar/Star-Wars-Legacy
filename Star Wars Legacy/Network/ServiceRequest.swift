//
//  ServiceRequest.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 14/05/22.
//

import Foundation

class ServiceRequest {
    
    func fetchPeople(completionHandler: @escaping ([People]) -> Void) {
        
        var people: [People]
        
        let url = "https://swapi.dev/api/people/"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data else {
                return
            }
            
            let peopleJSON = try? JSONDecoder().decode(People.self, from: data)
            print(peopleJSON)
        }.resume()
    }
    
    
    
}
