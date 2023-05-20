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
        guard let base = HttpUrl(url: baseURL) else {
            return nil
        }
        self.base = base
    }
    
    let base: HttpUrl
    let client: HttpClient = UrlSessionHttpClient(logLevel: .info)
    
    func siteInfo() async throws -> SiteInfo {
        try await decodableRequest(
            executor: client.dataTask,
            url: base.path(Endpoint.site.rawValue),
            method: .get
        )
    }
}
