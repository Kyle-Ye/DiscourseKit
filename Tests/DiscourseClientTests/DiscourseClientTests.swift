@testable import DiscourseClient
@testable import DiscourseModel

import Mocker
import XCTest

final class DiscourseKitTests: XCTestCase {
    private let baseURL = URL(string: "https://forums.swift.org")!
    
    func testSiteInfoAPI() async throws {
        let originalURL = baseURL.appending(path: Endpoint.site.rawValue)
        let mockedSiteInfoData = try Data(contentsOf: Bundle.module.url(forResource: "site", withExtension: "json")!)
        let mock = Mock(
            url: originalURL,
            dataType: .json,
            statusCode: 200,
            data: [
                .get: mockedSiteInfoData,
            ]
        )
        
        mock.register()
        let client = try XCTUnwrap(Client(baseURL: baseURL))
        _ = try await client.fetchSiteInfo()
    }
    
    func testCategoryAPI() async throws {
        let originalURL = baseURL.appending(path: Endpoint.categories.rawValue)
        let mockedCategoriesData = try Data(contentsOf: Bundle.module.url(forResource: "categories", withExtension: "json")!)
        let mock = Mock(
            url: originalURL,
            dataType: .json,
            statusCode: 200,
            data: [
                .get: mockedCategoriesData,
            ]
        )
        mock.register()
        let client = try XCTUnwrap(Client(baseURL: baseURL))
        _ = try await client.fetchCategories()
    }
}
