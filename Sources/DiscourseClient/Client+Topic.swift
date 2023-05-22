//
//  Client+Topic.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import DiscourseModel
import Foundation

extension Client {
    public func fetchLatest(page: Int = 0) async throws -> Listing {
        try await _apiCollection.latest(page: page)
    }

    public func fetchCategoryDetail(_ category: Category) async throws -> Listing {
        try await fetchCategoryDetail(slug: category.slug, id: category.id)
    }
    
    public func fetchCategoryDetail(slug: String, id: Int) async throws -> Listing {
        try await _apiCollection.categoryDetail(slug: slug, id: id)
    }
}
