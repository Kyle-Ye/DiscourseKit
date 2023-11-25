//
//  Client+APIKey.swift
//
//
//  Created by Kyle on 2023/11/25.
//

import DiscourseModel

extension Client {
    public func fetchUserAPIKeyHead() async throws -> UserAPINewHeadResponse {
        try await _apiCollection.userAPIKeyHead()
    }
}

