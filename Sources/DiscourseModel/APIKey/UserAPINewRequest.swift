//
//  UserAPINewRequest.swift
//
//
//  Created by Kyle on 2023/11/26.
//

import Foundation

public struct UserAPINewRequest {
    public init(
        applicationName: String,
        clientID: String,
        nonce: String,
        scopes: [UserAPINewRequest.Scope],
        publicKey: String,
        authRedirect: URL? = nil
    ) {
        self.applicationName = applicationName
        self.clientID = clientID
        self.nonce = nonce
        self.scopes = scopes
        self.publicKey = publicKey
        self.authRedirect = authRedirect
    }

    public let applicationName: String
    public let clientID: String
    public let nonce: String
    public let scopes: [Scope]
    public let publicKey: String
    public let authRedirect: URL?

    public enum Scope: String, CaseIterable {
        case notifications
        case sessionInfo = "session_info"
        case write
    }
}
