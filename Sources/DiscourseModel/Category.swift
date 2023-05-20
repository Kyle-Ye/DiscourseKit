//
//  Category.swift
//
//
//  Created by Kyle on 2023/5/20.
//

import Foundation

public struct Category: Codable {
    public var id: Int
    public var name: String
    public var slug: String
    public var color: String
    public var position: Int
    public var postCount: Int
    public var topicCount: Int
    public var hasChildren: Bool
    public var subcategoryIds: [Int]
    public var description: String
    public var descriptionText: String
    public var descriptionExcerpt: String
}
