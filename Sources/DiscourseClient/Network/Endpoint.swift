//
//  Endpoint.swift
//
//
//  Created by Kyle on 2023/5/20.
//

import DiscourseModel
import Foundation

/// Discourse API endpoints
public struct Endpoint<Value: Codable>: Hashable, RawRepresentable, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) { self.rawValue = rawValue }
    public init(stringLiteral value: String) { self.init(rawValue: value) }
    
//    public static let preAuth: Endpoint = "/session/csrf"
//    public static let login: Endpoint = "/session"
//    public static let search: Endpoint = "/search"
//
//    public static let comments: Endpoint = "/posts.json"
//    public static func comment(for id: Int) -> Self {
//        .init(rawValue: "/posts/\(id).json")
//    }
//
//    public static func feed(for id: String) -> Self {
//        .init(rawValue: "/\(id).json")
//    }
//
//    public static func category(for id: Int) -> Self {
//        .init(rawValue: "/c/\(id)/show.json")
//    }
}

extension Endpoint {
    var paths: [String] {
        rawValue.split(separator: "/").map { String($0) }
    }
}

// MARK: - Site

extension Endpoint where Value == Site {
    public static let site: Endpoint = "/site.json"
}

extension Endpoint where Value == SiteBasicInfo {
    public static let siteBasicInfo: Endpoint = "/site/basic-info.json"
}

// MARK: - Category

extension Endpoint where Value == CategoryList {
    public static let categories: Endpoint = "/categories.json"
}

// MARK: - Topic

extension Endpoint where Value == Topic {
    public static let latest: Endpoint = "/latest.json"
}
