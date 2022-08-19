//
//  DetailsViewModel.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 24/06/22.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {
    
    @Published var homeworld: Planet?
    private var cancellable: AnyCancellable?
    
    func fetchHomeworld(url: String) {
        
        cancellable = NetworkManager.shared.fetchPlanets(url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("finished")
                }
            }, receiveValue: { [weak self] planet in
                self?.homeworld = planet
            })
    }
    
    func fetchFilmsList() {
        
    }
    
}
