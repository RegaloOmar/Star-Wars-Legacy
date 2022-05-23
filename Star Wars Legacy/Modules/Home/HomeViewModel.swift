//
//  HomeViewModel.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 15/05/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var starWarsPeople: [StarWarsPeople] = []
    
    
    private var nextPage: String?
    private var preciousPage: String?
    private var networkManager = NetworkManager()
    
    init() {
        fetchPeople()
    }
    
    private func fetchPeople() {
        networkManager.fetchPeople { [weak self] people in
            
            self?.nextPage = people.next
            self?.preciousPage = people.previous
            self?.starWarsPeople = people.results
            
        }
    }
    
    
}
