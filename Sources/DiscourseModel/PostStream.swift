//
//  PostStream.swift
//
//
//  Created by Kyle on 2023/6/2.
//

import Foundation

public struct PostStream: Codable, Hashable {
    public let posts: [Post]
    public let streams: [Int]
    
    enum CodingKeys: String, CodingKey {
        case posts
        case streams
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        posts = try container.decodeIfPresent([Post].self, forKey: .posts) ?? []
        streams = try container.decodeIfPresent([Int].self, forKey: .streams) ?? []
    }
}
