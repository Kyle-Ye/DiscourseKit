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
    public let actionCode: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case avatarTemplate = "avatar_template"
        case createdAt = "created_at"
        case cooked
        case actionsSummary = "actions_summary"
        case actionCode = "action_code"
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
        self.actionCode = try container.decodeIfPresent(String.self, forKey: .actionCode) ?? ""
    }
}

// MARK: Avatar

extension Post {
    public func avatar(size: Int) -> URL? {
        let regex = #/{size}/#
        let avatarString = avatarTemplate.replacing(regex) { _ in
            size.description
        }
        return URL(string: avatarString)
    }
}

// MARK: - likeAction

extension Post {
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

// MARK: - actionCode

extension Post {
    public enum ActionCode: String {
        case closed = "closed.enabled"
        case pinned = "pinned.enabled"
        case split = "split_topic"
    }
    
    public var isClosed: Bool {
        actionCode == ActionCode.closed.rawValue
    }
    
    public var isPinned: Bool {
        actionCode == ActionCode.pinned.rawValue
    }
    
    public var isSplit: Bool {
        actionCode == ActionCode.split.rawValue
    }
}
