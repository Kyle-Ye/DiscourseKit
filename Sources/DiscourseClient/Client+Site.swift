//
//  Client+Site.swift
//
//
//  Created by Kyle on 2023/5/20.
//

import DiscourseModel
import Foundation

extension Client {
    public func fetchSiteInfo() async throws -> SiteInfo {
        try await _apiCollection.siteInfo()
    }
}
