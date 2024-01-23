@testable import OpenDiscourseKit
import OpenAPIURLSession
import BundleResource
import Mocker
import XCTest

final class ClientAPITests: XCTestCase {
    private let baseURL = URL(string: "https://forums.swift.org")!
    private let client = Client(serverURL: URL(string: "https://forums.swift.org")!, transport: URLSessionTransport())
    
    // MARK: - Help functions

    private func registerMock(endpoint: String) throws {
        let baseResourceURL = try XCTUnwrap(Bundle.resource.resourceURL)
        let resourceURL = baseResourceURL.appending(path: "Resources/swift-forums").appending(path: endpoint)
        let mockedData = try Data(contentsOf: resourceURL)
        let url = baseURL.appending(path: endpoint)
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
        try registerMock(endpoint: "/site.json")
        _ = try await client.getSite(.init())
    }
    
    // TODO: site/basic-info is not provided currently
    func testSiteBasicInfoAPI() async throws {
//        try registerMock(endpoint: "/site/basic-info.json")
//        _ = try await client.fetchSiteBasicInfo()
    }
    
    // MARK: - Category API

    func testCategoryAPI() async throws {
        try registerMock(endpoint: "/categories.json")
        _ = try await client.listCategories()
    }
    
    // MARK: - Listing API

    func testLatestAPI() async throws {
        try registerMock(endpoint: "/latest.json")
        _ = try await client.listLatestTopics(headers: .init(Api_hyphen_Key: "", Api_hyphen_Username: ""))
    }
    
    // MARK: - Topic API

    func testTopicAPI() async throws {
        let id = 8
        try registerMock(endpoint: "/t/\(id).json")
        _ = try await client.getTopic(.init(path: .init(id: id.description), headers: .init(Api_hyphen_Key: "", Api_hyphen_Username: "")))
    }
}
