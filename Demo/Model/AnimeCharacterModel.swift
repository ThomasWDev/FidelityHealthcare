//
//  AnimeCharacterModel.swift
//  Demo
//
//  Copyright © 2020 Thomas Woodfin. All rights reserved.
//
import UIKit
import Alamofire

struct AnimeCharacterSearchModel: Codable {

    let results: [AnimeCharacterModel]
    let requestHash: String
    let requestCached : Bool

    enum CodingKeys: String, CodingKey {
        case results
        case requestCached = "request_cached"
        case requestHash = "request_hash"
    }
}

struct AnimeCharacterModel: Codable {
    let imageUrl: String
    let synopsis, type, title, rated: String?
    let episodes, members: Int
    let score: Double
    let airing: Bool

    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case title
        case synopsis
        case type
        case episodes
        case score
        case members
        case airing
        case rated

    }
}
