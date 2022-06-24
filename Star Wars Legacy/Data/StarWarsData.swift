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
    var results: [Character]
}
