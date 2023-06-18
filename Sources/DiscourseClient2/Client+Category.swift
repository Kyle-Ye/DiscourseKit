//
//  Client+Category.swift
//
//
//  Created by Kyle on 2023/5/21.
//

import DiscourseModel
import Foundation
public typealias Category = DiscourseModel.Category

extension Client {
    public func fetchCategories(includeSubcategories: Bool? = nil) async throws -> CategoryList {
        try await _apiCollection.categories(includeSubcategories: includeSubcategories)
    }
}
