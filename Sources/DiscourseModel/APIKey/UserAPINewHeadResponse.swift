//
//  UserAPINewHeadResponse.swift
//  
//
//  Created by Kyle on 2023/11/25.
//

import Foundation

public struct UserAPINewHeadResponse: Codable, Hashable {
    public let authAPIVersion: Int

    public init(authAPIVersion: Int) {
        self.authAPIVersion = authAPIVersion
    }
}
