//
//  JSONDecoder+Discourse.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

extension DateFormatter {
    public static var discourse: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = .gmt
        return formatter
    }
}

extension JSONDecoder {
    public static var discourse: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.discourse)
        return decoder
    }
}
