import DiscourseClient
import DiscourseModel
import Mocker
import XCTest

final class ClientAPITests: XCTestCase {
    private let baseURL = URL(string: "https://forums.swift.org")!
    private let client = Client(baseURL: URL(string: "https://forums.swift.org")!)
    
    // MARK: - Help functions

    private func registerMock(url: URL, name: String) throws {
        let mockedData = try Data(contentsOf: Bundle.module.url(forResource: name, withExtension: "json")!)
        let mock = Mock(
            url: url,
            dataType: .json,
            statusCode: 200,
            data: [
                .get: mockedData,
            ]
        )
        mock.register()
    }
    
    // MARK: - Site API

    func testSiteAPI() async throws {
        let originalURL = baseURL.appending(path: Endpoint.site.rawValue)
        try registerMock(url: originalURL, name: "site")
        _ = try await client.fetchSite()
    }
    
    func testSiteBasicInfoAPI() async throws {
        let originalURL = baseURL.appending(path: Endpoint.siteBasicInfo.rawValue)
        try registerMock(url: originalURL, name: "basic-info")
        _ = try await client.fetchSiteBasicInfo()
    }
    
    // MARK: - Category API

    func testCategoryAPI() async throws {
        let originalURL = baseURL.appending(path: Endpoint.categories.rawValue)
        try registerMock(url: originalURL, name: "categories")
        _ = try await client.fetchCategories()
    }
    
    // MARK: - Listing API

    func testLatestAPI() async throws {
        let originalURL = baseURL.appending(path: Endpoint.latest.rawValue)
        try registerMock(url: originalURL, name: "latest")
        _ = try await client.fetchLatest()
    }
}
