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
            .init(name: "application_name", value: request.applicationName),
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
