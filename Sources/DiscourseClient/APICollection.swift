//
//  APIClient.swift
//
//
//  Created by Kyle on 2023/5/21.
//

import DiscourseModel
import Foundation
@_implementationOnly import SwiftHttp

class APICollectioin: HttpCodablePipelineCollection {
    init(baseURL: URL) {
        self.base = HttpUrl(host: baseURL.host() ?? "", trailingSlashEnabled: false)
    }
    
    let base: HttpUrl
    let client: HttpClient = UrlSessionHttpClient(logLevel: .info)
    
    // MARK: - HttpCodablePipelineCollection

    func decoder<T>() -> HttpResponseDecoder<T> where T: Decodable {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(formatter)
        return .json(decoder)
    }
    
    // MARK: - Site API
    
    func site() async throws -> Site {
        try await decodableRequest(
            executor: client.dataTask,
            url: base.path(Endpoint.site.paths),
            method: .get
        )
    }
    
    func siteBasicInfo() async throws -> SiteBasicInfo {
        try await decodableRequest(
            executor: client.dataTask,
            url: base.path(Endpoint.siteBasicInfo.paths),
            method: .get
        )
    }
    
    // MARK: - Category API
    
    func categories(includeSubcategories: Bool?) async throws -> CategoryList {
        let url: HttpUrl
        if let includeSubcategories {
            url = base.query(["include_subcategories": includeSubcategories.description])
        } else {
            url = base
        }
        return try await decodableRequest(
            executor: client.dataTask,
            url: url.path(Endpoint.categories.paths),
            method: .get
        )
    }
    
    // MARK: - Topic API

    func latest(order: Order? = nil, ascending: Bool? = nil) async throws -> Latest {
        var url: HttpUrl = base
        if let order {
            url = url.query(["order": order.rawValue])
        }
        if let ascending {
            url = url.query(["ascending": ascending.description])
        }
        return try await decodableRequest(
            executor: client.dataTask,
            url: url.path(Endpoint.latest.paths),
            method: .get
        )
    }
}
