//
//  CategorieViewModel.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 20/05/22.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    
    @Published var isRequestFailed = false
    @Published var characterList: [StarWarsPeople] = []
    var nextPage: String?
    var previousPage: String?
    private var cancellable: AnyCancellable?
    
    
    
    func fetchCharacters() {
        
        cancellable = NetworkManager.shared.fetchCharacters()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished")
                }
            }, receiveValue: { [weak self] galaxyList in
                self?.characterList = galaxyList.results
                self?.nextPage = galaxyList.next
                self?.previousPage = galaxyList.previous
            })
    }
    
}
