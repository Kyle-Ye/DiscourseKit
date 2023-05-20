//
//  File.swift
//
//
//  Created by Kyle on 2023/5/21.
//

import Foundation

public struct CategoryList: Codable {
    public var canCreateCategory: Bool
    public var canCreateTopic: Bool
    public var categories: [Category]

    enum RootCodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }

    enum CodingKeys: String, CodingKey {
        case canCreateCategory = "can_create_category"
        case canCreateTopic = "can_create_topic"
        case categories
    }

    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let container = try rootContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .categoryList)
        self.canCreateCategory = try container.decode(Bool.self, forKey: .canCreateCategory)
        self.canCreateTopic = try container.decode(Bool.self, forKey: .canCreateTopic)
        self.categories = try container.decode([Category].self, forKey: .categories)
    }

    public func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: RootCodingKeys.self)
        var container = rootContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .categoryList)
        try container.encode(self.canCreateCategory, forKey: .canCreateCategory)
        try container.encode(self.canCreateTopic, forKey: .canCreateTopic)
        try container.encode(self.categories, forKey: .categories)
    }
}
