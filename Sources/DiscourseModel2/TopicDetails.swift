//
//  TopicDetails.swift
//
//
//  Created by Kyle on 2023/6/3.
//

import Foundation

public struct TopicDetails: Codable, Hashable {
    public let createdBy: User
    public let lastPoster: User
    
    enum CodingKeys: String, CodingKey {
        case createdBy = "created_by"
        case lastPoster = "last_poster"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdBy = try container.decode(User.self, forKey: .createdBy)
        lastPoster = try container.decode(User.self, forKey: .lastPoster)
    }
}
