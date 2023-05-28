//
//  JSONDecoder+DiscourseTests.swift
//
//
//  Created by Kyle on 2023/5/28.
//

import XCTest

final class JSONDecoder_DiscourseTests: XCTestCase {
    func testDiscourseDateFormatter() throws {
        struct Demo: Decodable {
            let date: Date
        }
        
        let data = #"""
        {
            "date": "2023-05-28T04:16:18.590Z"
        }
        """#.data(using: .utf8)!
        let demo = try JSONDecoder.discourse.decode(Demo.self, from: data)
        XCTAssertEqual(demo.date.timeIntervalSince1970, 1685247378.59)
        
    }
}
