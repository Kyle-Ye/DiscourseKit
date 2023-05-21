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
    init?(baseURL: URL) {
        guard let host = baseURL.host() else {
            return nil
        }
        self.base = HttpUrl(host: host, trailingSlashEnabled: false)
    }
    
    let base: HttpUrl
    let client: HttpClient = UrlSessionHttpClient(logLevel: .info)
    
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
}
