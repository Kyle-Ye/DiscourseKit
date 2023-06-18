//
//  Action.swift
//
//
//  Created by Kyle on 2023/6/2.
//

import Foundation

public struct Action: Codable, Hashable {
    public let id: Int
    public let count: Int
    public let canAct: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case count
        case canAct = "can_act"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: CodingKeys.id)
        self.count = try container.decodeIfPresent(Int.self, forKey: CodingKeys.count) ?? 0
        self.canAct = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.canAct) ?? false
    }
    
    init(id: Int, count: Int = 0, canAct: Bool = false) {
        self.id = id
        self.count = count
        self.canAct = canAct
    }
    
    public static let like = Action(id: 2)
}
