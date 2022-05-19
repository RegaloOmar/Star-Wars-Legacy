//
//  ServiceRequest.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 14/05/22.
//

import Foundation

class NetworkManager {
    
    func fetchPeople(completionHandler: @escaping (GalaxyList) -> Void) {
        
        let url = URL(string: "https://swapi.dev/api/people/?page=1")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                
                guard let data = data else { return }
                
                do{
                    let peopleJSON = try JSONDecoder().decode(GalaxyList.self, from: data)
                    print(peopleJSON.count)
                    
                    DispatchQueue.global(qos: .userInteractive).async {
                        completionHandler(peopleJSON)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }  
}
