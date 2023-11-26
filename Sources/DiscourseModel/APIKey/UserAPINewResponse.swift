//
//  UserAPINewResponse.swift
//
//
//  Created by Kyle on 2023/11/26.
//

import Foundation

// TODO: Add otp support
public struct UserAPINewResponse: Decodable {
    public let key: String
    public let nonce: String
    public let push: Bool
    public let api: Int
}
