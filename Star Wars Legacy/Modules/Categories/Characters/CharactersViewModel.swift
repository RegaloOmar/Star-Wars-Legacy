//
//  CategorieViewModel.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 20/05/22.
//

import Foundation

class CharactersViewModel: ObservableObject {
    
    private var networkManager = NetworkManager()
    var characterList: [StarWarsPeople]?
    var nextPage: String?
    var previousPage: String?
    
    init() {
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        
        networkManager.fetchPeople { galaxy in
            self.characterList = galaxy.results
            self.nextPage = galaxy.next
            self.previousPage = galaxy.previous
        }
        
    }
}
