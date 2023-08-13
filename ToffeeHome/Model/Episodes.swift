//
//  Episodes.swift
//  ToffeeHome
//
//  Created by Khaled on 13/8/23.
//

import Foundation
// MARK: - Episode
struct Episode: Codable, Hashable {
    let id: Int?
    let url: String?
    let name: String?
    let season, number: Int?
    let airdate: String?
    let runtime: Double?
    let rating: Rating?
    let image: Image?
    let summary: String?
}
// MARK: - Image
struct Image: Codable , Hashable {
    let medium, original: String?
}

// MARK: - Rating
struct Rating: Codable, Hashable {
    let average: Double?
}
