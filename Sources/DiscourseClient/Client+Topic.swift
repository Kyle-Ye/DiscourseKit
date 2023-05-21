//
//  Client+Topic.swift
//  
//
//  Created by Kyle on 2023/5/22.
//

import DiscourseModel
import Foundation

extension Client {
    public func fetchLatest() async throws -> Latest {
        try await _apiCollection.latest()
    }
}
