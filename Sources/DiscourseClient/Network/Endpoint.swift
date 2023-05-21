//
//  Endpoint.swift
//
//
//  Created by Kyle on 2023/5/20.
//

import Foundation

/// Discourse API endpoints
public struct Endpoint: Hashable, RawRepresentable, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) { self.rawValue = rawValue }
    public init(stringLiteral value: String) { self.init(rawValue: value) }
    
    // MARK: Site
    
    public static let site: Endpoint = "/site.json"
    public static let siteBasicInfo: Endpoint = "/site/basic-info.json"
    
    // MARK: Other
    
    public static let preAuth: Endpoint = "/session/csrf"
    public static let login: Endpoint = "/session"
    public static let search: Endpoint = "/search"
    
    public static let comments: Endpoint = "/posts.json"
    public static func comment(for id: Int) -> Self {
        .init(rawValue: "/posts/\(id).json")
    }
    
    public static func feed(for id: String) -> Self {
        .init(rawValue: "/\(id).json")
    }
    
    public static let categories: Self = "/categories.json"
    public static func category(for id: Int) -> Self {
        .init(rawValue: "/c/\(id)/show.json")
    }
}

extension Endpoint {
    var paths: [String] {
        rawValue.split(separator: "/").map { String($0) }
    }
}
