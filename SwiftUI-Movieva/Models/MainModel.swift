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




