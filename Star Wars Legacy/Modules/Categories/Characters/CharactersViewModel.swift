//
//  CategorieViewModel.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 20/05/22.
//

import Foundation

class CharactersViewModel: ObservableObject {
    
    private var networkManager = NetworkManager()
    @Published var characterList: [StarWarsPeople] = []
    var nextPage: String?
    var previousPage: String?
    
    
    func fetchCharacters() {
        
        networkManager.fetchCharacters { [weak self] galaxy in
            
            DispatchQueue.main.async {
                self?.characterList = galaxy.results
                self?.nextPage = galaxy.next
                self?.previousPage = galaxy.previous
            }
        }
        
    }
}
