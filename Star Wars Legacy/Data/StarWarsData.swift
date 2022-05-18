//
//  StarWarsData.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 15/05/22.
//

import Foundation

struct GalaxyList: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [StarWarsPeople]?
}

struct StarWarsPeople: Decodable {
    
    let name: String
    let height : String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]?
    let starship: [String]?
    let created: Date
    let edited: Date
    let url: String
}
