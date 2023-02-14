//
//  MainModel.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 10.02.2023.
//

import Foundation

struct Photos: Codable {
    
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
}

struct User: Codable {
    
    let id: Int
    let name: String
    let email: String
    let company: Company

}

struct Company: Codable {
    let name: String
}


struct Movie: Codable {
    let page: Int?
    let results: [ResultMovie]?
}

struct ResultMovie: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language, original_title, overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date, title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}



