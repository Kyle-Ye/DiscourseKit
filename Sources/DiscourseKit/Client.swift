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
    }
    
    /// Check if the url is a discourse server
    public static func check(url _: URL) -> Bool {
        fatalError("Not implemented")
    }
    
    /// Check if the url is a discourse server
    public func check() -> Bool {
        Client.check(url: baseURL)
    }
    
    // MARK: - Internal Implementation Detail

    let baseURL: URL
}
