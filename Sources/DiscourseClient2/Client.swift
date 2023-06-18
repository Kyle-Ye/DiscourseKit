//
//  Client.swift
//
//
//  Created by Kyle on 2023/5/20.
//

import Foundation

/// A client to fetch Discourse Server infomation
public final class Client {
    // MARK: - Public Interface
    
    /// Init a discourse client with a baseURL
    /// - Parameter baseURL: The base URL of the Discourse Server
    public init(baseURL: URL) {
        self.baseURL = baseURL
        self._apiCollection = APICollectioin(baseURL: baseURL)
    }
    
    /// Check if the url is a discourse server
    public static func check(url: URL) async -> Bool {
        await Client(baseURL: url).check()
    }
    
    /// Check if the url is a discourse server
    public func check() async -> Bool {
        do {
            _ = try await _apiCollection.siteBasicInfo()
            return true
        } catch {
            return false
        }
    }
    
    // MARK: - Internal Implementation Detail

    let baseURL: URL
    
    let _apiCollection: APICollectioin
}
