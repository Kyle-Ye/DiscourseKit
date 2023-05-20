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
    
    func siteInfo() async throws -> SiteInfo {
        try await decodableRequest(
            executor: client.dataTask,
            url: base.path(Endpoint.site.paths),
            method: .get
        )
    }
    
    // MARK: - Category API
    
    func categories(includeSubcategories _: Bool?) async throws -> CategoryList {
        try await decodableRequest(
            executor: client.dataTask,
            url: base.path(Endpoint.categories.paths),
            method: .get
        )
    }
}
