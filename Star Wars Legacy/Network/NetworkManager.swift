//
//  ServiceRequest.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 14/05/22.
//

import Foundation

class NetworkManager {
    
    func fetchPeople(completionHandler: @escaping (GalaxyList) -> Void) {
        
        let url = URL(string: "https://swapi.dev/api/people")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            print(data)
            do{
                let peopleJSON = try JSONDecoder().decode(GalaxyList.self, from: data)
                print(peopleJSON)
                
                DispatchQueue.global(qos: .userInteractive).async {
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
    
}
