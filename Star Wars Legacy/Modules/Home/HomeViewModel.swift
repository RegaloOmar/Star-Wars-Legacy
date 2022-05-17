//
//  HomeViewModel.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 15/05/22.
//

import Foundation

class HomeViewModel {
    
    private var service = NetworkManager()
    
    
    
    func fetchPeople() {
        service.fetchPeople { [weak self] people in
            
        }
    }
    
    
}
