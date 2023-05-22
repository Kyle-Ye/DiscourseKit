//
//  JSONDecoder+Discourse.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

extension JSONDecoder {
    public static var discourse: JSONDecoder {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }
}
