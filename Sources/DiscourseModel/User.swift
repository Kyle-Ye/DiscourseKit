//
//  User.swift
//  
//
//  Created by Kyle on 2023/5/23.
//

import Foundation

public struct User: Codable, Hashable {
    public let id: Int
    public let name: String?
    public let userName: String
    public let avatarTemplate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userName = "username"
        case avatarTemplate = "avatar_template"
    }
}

extension User {
    public func avatar(size: Int) -> URL? {
        let regex = #/{size}/#
        let avatarString = avatarTemplate.replacing(regex) { _ in
            size.description
        }
        return URL(string: avatarString)
    }
}
