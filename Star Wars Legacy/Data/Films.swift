//
//  Films.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 17/06/22.
//

import Foundation

struct Films {
    
    var id = UUID()
    var characters: [String]
    var created: String
    var director: String
    var edited: String
    var episodeId: Int
    var openingCrawl: String
    var planets: [String]
    var producer: String
    var releaseDate: String
    var species: [String]
    var starships: [String]
    var title: String
    var url: String
    var vehicules: [String]
    
    private enum CodingKeys: String, CodingKey {
        
        case characters
        case created
        case director
        case edited
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case planets
        case producer
        case releaseDate = "release_date"
        case species
        case starships
        case title
        case url
        case vehicules
    }
    
}
