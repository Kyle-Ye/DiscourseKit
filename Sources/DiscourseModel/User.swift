//
//  User.swift
//  
//
//  Created by Kyle on 2023/5/23.
//

import Foundation

public struct User: Codable {
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
