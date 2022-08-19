//
//  PlanetsViewModel.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 03/07/22.
//

import Foundation
import Combine

class PlanetsListViewModel: ObservableObject {
    
    @Published var requestFailure = false
    var nextPage: String?
    private var cancellable: AnyCancellable?
    @Published var planets: [Planet] = []
    
    
    private func getPlanets(_ url: String) {
        
        cancellable = NetworkManager.shared.fetchPlanets(url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                    case .finished:
                        self?.requestFailure = false
                    case .failure(let error):
                        self?.requestFailure = true
                        print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] planets in
                self?.planets = planets.results
                self?.nextPage = planets.next
                
            })
    }
    
    func goToNextPage(_ url: String) {
        
    }
    
    func errorMessage() {
        
    }
    
    
}
