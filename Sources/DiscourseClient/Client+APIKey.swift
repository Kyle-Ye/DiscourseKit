//
//  Client+APIKey.swift
//
//
//  Created by Kyle on 2023/11/25.
//

import DiscourseModel
import Foundation

extension Client {
    public func fetchUserAPIKeyHead() async throws -> UserAPINewHeadResponse {
        try await _apiCollection.userAPIKeyHead()
    }

    public func generateUserAPIKey(from request: UserAPINewRequest) -> URL? {
        guard var components = URLComponents(string: baseURL.absoluteString) else {
            return nil
        }
        components.path = Endpoint.userAPIKeyHeader.rawValue

        let allowedCharacters = CharacterSet
            .urlQueryAllowed
            .subtracting(CharacterSet(charactersIn: #"/+"#))

        var items: [URLQueryItem] = [
            URLQueryItem.init(name: "application_name", value: request.applicationName),
            .init(name: "client_id", value: request.clientID),
            .init(name: "nonce", value: request.nonce),
            .init(name: "scopes", value: request.scopes.map(\.rawValue).joined(separator: ",")),
            .init(name: "public_key", value: request.publicKey),
        ]
        if let url = request.authRedirect {
            items.append(.init(name: "auth_redirect", value: url.absoluteString))
        }
        components.percentEncodedQueryItems = items.map {
            URLQueryItem(
                name: $0.name,
                value: $0.value?.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
            )
        }
        return components.url
    }
}

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
