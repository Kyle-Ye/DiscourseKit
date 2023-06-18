//
//  swift
//
//
//  Created by Kyle on 2023/6/2.
//

import Foundation

public struct Post: Codable, Hashable {
    public let id: Int
    public let name: String
    public let username: String
    public let avatarTemplate: String
    public let createdAt: Date
    public let cooked: String
    public let actionsSummary: [Action]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case avatarTemplate = "avatar_template"
        case createdAt = "created_at"
        case cooked
        case actionsSummary = "actions_summary"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.username = try container.decode(String.self, forKey: .username)
        self.avatarTemplate = try container.decode(String.self, forKey: .avatarTemplate)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.cooked = try container.decode(String.self, forKey: .cooked)
        self.actionsSummary = try container.decode([Action].self, forKey: .actionsSummary)
    }
}

extension Post {
    public func avatar(size: Int) -> URL? {
        let regex = #/{size}/#
        let avatarString = avatarTemplate.replacing(regex) { _ in
            size.description
        }
        return URL(string: avatarString)
    }
    
    public var likeAction: Action? {
        actionsSummary.first { $0.id == Action.like.id }
    }
    
    public var likeCount: Int {
        likeAction?.count ?? 0
    }
    
    public var likeCanAct: Bool {
        likeAction?.canAct ?? false
    }
}
