//
//  SiteBasicInfoTests.swift
//  
//
//  Created by Kyle on 2023/9/10.
//

@testable import DiscourseModel
import XCTest

final class SiteBasicInfoTests: XCTestCase {
    private func jsonData(for name: String) throws -> Data {
        let baseResourceURL = try XCTUnwrap(Bundle.module.resourceURL)
        let resourceURL = baseResourceURL.appending(path: "Resources/SiteBasicInfo").appending(path: name)
        return try Data(contentsOf: resourceURL)
    }
    
    func testDescription() throws {
        let decoder = JSONDecoder()
        let _ = try decoder.decode(SiteBasicInfo.self, from: jsonData(for: "netlify.json"))
        let _ = try decoder.decode(SiteBasicInfo.self, from: jsonData(for: "figma.json"))
    }
}
