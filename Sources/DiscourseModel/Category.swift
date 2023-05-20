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
    public var subcategoryIDs: [Int]
    public var description: String?
    public var descriptionText: String?
    public var descriptionExcerpt: String?
    public var showSubcategoryList: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, color, position
        case postCount = "post_count"
        case topicCount = "topic_count"
        case hasChildren = "has_children"
        case subcategoryIDs = "subcategory_ids"
        case description
        case descriptionText = "description_text"
        case descriptionExcerpt = "description_excerpt"
        case showSubcategoryList = "show_subcategory_list"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        self.color = try container.decodeIfPresent(String.self, forKey: .color) ?? ""
        self.position = try container.decodeIfPresent(Int.self, forKey: .position) ?? 0
        self.postCount = try container.decodeIfPresent(Int.self, forKey: .postCount) ?? 0
        self.topicCount = try container.decodeIfPresent(Int.self, forKey: .topicCount) ?? 0
        self.hasChildren = try container.decodeIfPresent(Bool.self, forKey: .hasChildren) ?? false
        self.subcategoryIDs = try container.decodeIfPresent([Int].self, forKey: .subcategoryIDs) ?? []
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.descriptionText = try container.decodeIfPresent(String.self, forKey: .descriptionText)
        self.descriptionExcerpt = try container.decodeIfPresent(String.self, forKey: .descriptionExcerpt)
        self.showSubcategoryList = try container.decodeIfPresent(Bool.self, forKey: .showSubcategoryList) ?? false
    }
}
