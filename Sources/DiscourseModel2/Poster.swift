//
//  Poster.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

public struct Poster: Codable, Hashable {
    public let extras: String?
    public let description: String
    public let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case extras
        case description
        case userID = "user_id"
    }
}

extension Poster {
    /// Check if the poster is the original poster
    public var isOP: Bool { description.contains("Original Poster") }
    
    /// Check if the poster is a frequent poster
    public var isFP: Bool { description.contains("Frequent Poster") }
    
    /// Check if the poster is a most recent poster
    public var isMRP: Bool { description.contains("Most Recent Poster") }
}
