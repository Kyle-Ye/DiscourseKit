//
//  Client+Topic.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import DiscourseModel
import Foundation

extension Client {
    public func fetchTopicDetail(id: Int) async throws -> Topic {
        try await _apiCollection.topicDetail(id: id)
    }
}
