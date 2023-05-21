//
//  Topic.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

public struct Topic: Codable {
    public let id: Int
    public let createdAt: Date

    public let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case title
    }
    
    
}
