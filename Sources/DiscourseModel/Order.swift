//
//  Order.swift
//
//
//  Created by Kyle on 2023/5/22.
//

import Foundation

public enum Order: String {
    case `default`
    case created
    case activity
    case views
    case posts
    case category
    case likes
    case opLikes = "op_likes"
    case posters
}
