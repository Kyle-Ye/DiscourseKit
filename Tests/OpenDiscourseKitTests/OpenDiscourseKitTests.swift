@testable import OpenDiscourseKit
import OpenAPIURLSession
import BundleResource
import Mocker
import XCTest

final class OpenDiscourseKitTests: XCTestCase {
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
        do {
            _ = try await client.getSite(.init())
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
