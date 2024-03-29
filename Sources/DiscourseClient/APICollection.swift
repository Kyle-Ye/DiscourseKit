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
        .json(.discourse)
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
    
    // MARK: - Listing API

    func latest(page: Int, order: Order? = nil, ascending: Bool? = nil) async throws -> Listing {
        var url: HttpUrl = base
        if page != 0 {
            url = url.query("page", page.description)
        }
        if let order {
            url = url.query("order", order.rawValue)
        }
        if let ascending {
            url = url.query("ascending", ascending.description)
        }
        return try await decodableRequest(
            executor: client.dataTask,
            url: url.path(Endpoint.latest.paths),
            method: .get
        )
    }
    
    func categoryDetail(slug: String, id: Int) async throws -> Listing {
        try await decodableRequest(
            executor: client.dataTask,
            url: base.path(Endpoint.categoryDetail(slug: slug, id: id).paths),
            method: .get
        )
    }
    
    // MARK: - Topic API
    
    func topicDetail(id: Int) async throws -> Topic {
        try await decodableRequest(
            executor: client.dataTask,
            url: base.path(Endpoint.topicDetail(id: id).paths),
            method: .get
        )
    }

    // MARK: - User API Keys

    func userAPIKeyHead() async throws -> UserAPINewHeadResponse {
        let headers = try await rawRequest(
            executor: client.dataTask,
            url: base.path(Endpoint.userAPIKeyHeader.paths),
            method: .head
        ).headers

        guard let versionString = headers[.init("auth-api-version")],
              let version = Int(versionString) else {
            throw HttpError.invalidResponse
        }
        return UserAPINewHeadResponse(authAPIVersion: version)
    }
}
