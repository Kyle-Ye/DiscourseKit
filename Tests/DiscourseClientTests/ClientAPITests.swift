import DiscourseClient
import DiscourseModel
import Mocker
import XCTest

final class ClientAPITests: XCTestCase {
    private let baseURL = URL(string: "https://forums.swift.org")!
    private let client = Client(baseURL: URL(string: "https://forums.swift.org")!)
    
    // MARK: - Help functions

    private func registerMock(endpoint: Endpoint<some Codable>) throws {
        let baseResourceURL = try XCTUnwrap(Bundle.module.resourceURL)
        let resourceURL = baseResourceURL.appending(path: "Resources/swift-forums").appending(path: endpoint.rawValue)
        let mockedData = try Data(contentsOf: resourceURL)
        let url = baseURL.appending(path: endpoint.rawValue)
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
        try registerMock(endpoint: Endpoint.site)
        _ = try await client.fetchSite()
    }
    
    func testSiteBasicInfoAPI() async throws {
        try registerMock(endpoint: Endpoint.siteBasicInfo)
        _ = try await client.fetchSiteBasicInfo()
    }
    
    // MARK: - Category API

    func testCategoryAPI() async throws {
        try registerMock(endpoint: Endpoint.categories)
        _ = try await client.fetchCategories()
    }
    
    // MARK: - Listing API

    func testLatestAPI() async throws {
        try registerMock(endpoint: Endpoint.latest)
        _ = try await client.fetchLatest()
    }
    
    // MARK: - Topic API

    func testTopicAPI() async throws {
        let id = 8
        try registerMock(endpoint: Endpoint.topicDetail(id: id))
        _ = try await client.fetchTopicDetail(id: id)
    }

    // MARK: - User API key API

    func testUserAPIKeyAPI() async throws {
        let url = baseURL.appending(path: Endpoint.userAPIKeyHeader.rawValue)
        let mock = Mock(
            url: url,
            dataType: .json,
            statusCode: 200,
            data: [
                .head: Data(),
            ],
            additionalHeaders: ["auth-api-version": "4"]
        )
        mock.register()
        let header = try await client.fetchUserAPIKeyHead()
        XCTAssertEqual(header.authAPIVersion, 4)
    }
}
