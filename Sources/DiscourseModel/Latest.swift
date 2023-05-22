//
//  Latest.swift
//  
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

public struct Latest: Codable {
    public var topicList: TopicList
    public var users: [User]
    
    enum CodingKeys: String, CodingKey {
        case topicList = "topic_list"
        case users
    }
}
