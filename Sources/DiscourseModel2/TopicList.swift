//
//  TopicList.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

public struct TopicList: Codable {
    public var perPage: Int
    public var topics: [Topic]
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
        case topics
    }
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.perPage = try container.decode(Int.self, forKey: TopicList.CodingKeys.perPage)
        self.topics = try container.decode([Topic].self, forKey: TopicList.CodingKeys.topics)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.perPage, forKey: TopicList.CodingKeys.perPage)
        try container.encode(self.topics, forKey: TopicList.CodingKeys.topics)
    }
}
