//
//  Poster.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

public struct Poster: Codable {
    public let extras: String?
    public let description: String
    public let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case extras
        case description
        case userID = "user_id"
    }
}
