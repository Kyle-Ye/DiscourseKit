//
//  UserTests.swift
//
//
//  Created by Kyle on 2023/5/23.
//

@testable import DiscourseModel
import XCTest

final class UserTests: XCTestCase {
    func testAvatar() throws {
        let user = User(id: -1, name: nil, username: "System", avatarTemplate: "/user_avatar/forums.swift.org/futurejones/{size}/13428_2.png")
        let url = try XCTUnwrap(user.avatar(size: 48))
        XCTAssertEqual(url.absoluteString, "/user_avatar/forums.swift.org/futurejones/48/13428_2.png")
    }
}
