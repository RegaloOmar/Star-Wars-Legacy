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
    @Published var characterList: [Character] = []
    var nextPage: String?
    private var cancellable: AnyCancellable?
    
    
    func fetchCharacters(_ url: String = DetailsLocalizedStrings.swCharactersPage) {
        
        cancellable = NetworkManager.shared.fetchCharacters(url)
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
                self?.characterList.append(contentsOf: galaxyList.results)
                self?.nextPage = galaxyList.next
            })
    }
    
    func getNextPage() {
        if let nextPage = self.nextPage {
            fetchCharacters(nextPage)
        }
    }
}
