//
//  Topic.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

public struct Topic: Codable, Hashable {
    public let id: Int
    public let categoryID: Int
    public let createdAt: Date
    public let title: String
    public let fancyTitle: String
    /// The total posts count
    public let postsCount: Int
    /// New posts count
    public let newPosts: Int
    public let tags: [String]
    public let imageURL: URL?
    public let posters: [Poster]
    public let closed: Bool
    
    // MARK: - Pin Info

    public let pinned: Bool
    public let pinnedGlobally: Bool
    
    // MARK: - Last Posted Info

    public let lastPostedAt: Date
    public let lastPosterUsername: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case createdAt = "created_at"
        case title
        case fancyTitle = "fancy_title"
        case postsCount = "posts_count"
        case newPosts = "new_posts"
        case tags
        case imageURL = "image_url"
        case posters
        case closed
        
        case pinned
        case pinnedGlobally = "pinned_globally"
        
        case lastPostedAt = "last_posted_at"
        case lastPosterUsername = "last_poster_username"
    }
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        categoryID = try container.decode(Int.self, forKey: .categoryID)
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        title = try container.decode(String.self, forKey: .title)
        fancyTitle = try container.decode(String.self, forKey: .fancyTitle)
        postsCount = try container.decode(Int.self, forKey: .postsCount)
        newPosts = try container.decodeIfPresent(Int.self, forKey: .newPosts) ?? 0
        tags = try container.decodeIfPresent([String].self, forKey: .tags) ?? []
        imageURL = try container.decodeIfPresent(URL.self, forKey: .imageURL)
        posters = try container.decode([Poster].self, forKey: .posters)
        closed = try container.decodeIfPresent(Bool.self, forKey: .closed) ?? false
        pinned = try container.decodeIfPresent(Bool.self, forKey: .pinned) ?? false
        pinnedGlobally = try container.decodeIfPresent(Bool.self, forKey: .pinnedGlobally) ?? false
        lastPostedAt = try container.decode(Date.self, forKey: .lastPostedAt)
        lastPosterUsername = try container.decode(String.self, forKey: .lastPosterUsername)
    }
}

extension Topic {
    public var op: Poster? {
        posters.first(where: \.isOP)
    }
}
