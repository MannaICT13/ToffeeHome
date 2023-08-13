//
//  Episodes.swift
//  ToffeeHome
//
//  Created by Khaled on 13/8/23.
//

import Foundation
// MARK: - Episode
struct Episode: Codable {
    let id: Int
    let url: String
    let name: String
    let season, number: Int
    let type: TypeEnum
    let airdate: String
    let airtime: Airtime
    let airstamp: Date
    let runtime: Int
    let rating: Rating
    let image: Image
    let summary: String
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id, url, name, season, number, type, airdate, airtime, airstamp, runtime, rating, image, summary
        case links = "_links"
    }
}

enum Airtime: String, Codable {
    case the2200 = "22:00"
}

// MARK: - Image
struct Image: Codable {
    let medium, original: String
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, show: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case show
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double
}

enum TypeEnum: String, Codable {
    case regular = "regular"
}

typealias Episodes = [Episode]
