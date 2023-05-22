//
//  Client+Topic.swift
//  
//
//  Created by Kyle on 2023/5/22.
//

import DiscourseModel
import Foundation

extension Client {
    public func fetchLatest(page: Int = 0) async throws -> Latest {
        try await _apiCollection.latest(page: page)
    }
}
