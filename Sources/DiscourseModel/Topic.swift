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
    public let fancyTitle: String
    /// The total posts count
    public let postsCount: Int
    /// New posts count
    public let newPosts: Int
    public let tags: [String]
    public let imageURL: URL?
    public let posters: [Poster]
    
    // MARK: - Pin Info

    public let pinned: Bool
    public let pinnedGlobally: Bool
    
    // MARK: - Last Posted Info

    public let lastPostedAt: Date
    public let lastPosterUsername: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case title
        case fancyTitle = "fancy_title"
        case postsCount = "posts_count"
        case newPosts = "new_posts"
        case tags
        case imageURL = "image_url"
        case posters
        
        case pinned
        case pinnedGlobally = "pinned_globally"
        
        case lastPostedAt = "last_posted_at"
        case lastPosterUsername = "last_poster_username"
    }
    
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: Topic.CodingKeys.id)
        self.createdAt = try container.decode(Date.self, forKey: Topic.CodingKeys.createdAt)
        self.title = try container.decode(String.self, forKey: Topic.CodingKeys.title)
        self.fancyTitle = try container.decode(String.self, forKey: Topic.CodingKeys.fancyTitle)
        self.postsCount = try container.decode(Int.self, forKey: Topic.CodingKeys.postsCount)
        self.newPosts = try container.decodeIfPresent(Int.self, forKey: Topic.CodingKeys.newPosts) ?? 0
        self.tags = try container.decode([String].self, forKey: Topic.CodingKeys.tags)
        self.imageURL = try container.decodeIfPresent(URL.self, forKey: Topic.CodingKeys.imageURL)
        self.posters = try container.decode([Poster].self, forKey: Topic.CodingKeys.posters)
        self.pinned = try container.decode(Bool.self, forKey: Topic.CodingKeys.pinned)
        self.pinnedGlobally = try container.decode(Bool.self, forKey: Topic.CodingKeys.pinnedGlobally)
        self.lastPostedAt = try container.decode(Date.self, forKey: Topic.CodingKeys.lastPostedAt)
        self.lastPosterUsername = try container.decode(String.self, forKey: Topic.CodingKeys.lastPosterUsername)
    }
}
