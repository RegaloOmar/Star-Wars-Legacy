//
//  StarWarsData.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 15/05/22.
//

import Foundation

struct GalaxyList: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [StarWarsPeople]
}

struct StarWarsPeople: Decodable, Identifiable, Hashable {
    
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
    var starship: [String]
    var vehicles: [String]
    var created: String
    var edited: String
    var url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.height = try container.decode(String.self, forKey: .height)
        self.mass = try container.decode(String.self, forKey: .mass)
        self.hairColor = try container.decode(String.self, forKey: .hairColor)
        self.skinColor = try container.decode(String.self, forKey: .skinColor)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.birthYear = try container.decode(String.self, forKey: .birthYear)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.homeworld = try container.decode(String.self, forKey: .homeworld)
        self.films = try container.decode([String].self, forKey: .films)
        self.species = try container.decode([String].self, forKey: .species)
        self.vehicles = try container.decode([String].self, forKey: .vehicles)
        self.created = try container.decode(String.self, forKey: .created)
        self.starship = try container.decode([String].self, forKey: .starships)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
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
