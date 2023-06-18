//
//  Client+Site.swift
//
//
//  Created by Kyle on 2023/5/20.
//

import DiscourseModel
import Foundation

extension Client {
    public func fetchSite() async throws -> Site {
        try await _apiCollection.site()
    }
    
    public func fetchSiteBasicInfo() async throws -> SiteBasicInfo {
        try await _apiCollection.siteBasicInfo()
    }
}
