//
//  PosterTests.swift
//
//
//  Created by Kyle on 2023/5/23.
//

@testable import DiscourseModel
import XCTest

final class PosterTests: XCTestCase {
    func testDescription() throws {
        let poster1 = Poster(extras: nil, description: "Original Poster, Most Recent Poster", userID: 0)
        XCTAssertTrue(poster1.isOP)
        XCTAssertTrue(poster1.isMRP)
        XCTAssertFalse(poster1.isFP)

        let poster2 = Poster(extras: nil, description: "Frequent Poster", userID: 1)
        XCTAssertTrue(poster2.isFP)
        XCTAssertFalse(poster2.isOP)
        XCTAssertFalse(poster2.isMRP)
    }
}
