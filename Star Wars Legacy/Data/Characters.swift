//
//  Characters.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 23/06/22.
//

import Foundation

struct Character: Decodable, Identifiable, Hashable {
    
    var id = UUID()
    var name: String
    var height : String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    var homeworld: String
    var films: [String]
    var species: [String]
    var starships: [String]
    var vehicles: [String]
    var created: String
    var edited: String
    var url: String
    
    private enum CodingKeys : String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case created
        case starships
        case edited
        case url
    }
}
