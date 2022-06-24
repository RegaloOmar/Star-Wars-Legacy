//
//  ImageData.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 23/06/22.
//

import Foundation

struct GoogleSearchResponse: Decodable {
    var items: [Item]
}

struct Item: Decodable {
    var link: String
}

struct JsonImage: Decodable {
    var name: String
    var image: String
}
