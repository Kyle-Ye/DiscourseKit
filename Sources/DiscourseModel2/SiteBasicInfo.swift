//
//  SiteBasicInfo.swift
//
//
//  Created by Kyle on 2023/5/21.
//

import Foundation

public struct SiteBasicInfo: Codable, Hashable {
    public let logoURL: URL
    public let logoSmallURL: URL
    public let appleTouchIconURL: URL
    public let faviconURL: URL
    public let title: String
    public let description: String
    public let headerPrimaryColor: String
    public let headerBackgroundColor: String
    public let loginRequired: Bool
    public let mobileLogoURL: URL
    
    enum CodingKeys: String, CodingKey {
        case logoURL = "logo_url"
        case logoSmallURL = "logo_small_url"
        case appleTouchIconURL = "apple_touch_icon_url"
        case faviconURL = "favicon_url"
        case title
        case description
        case headerPrimaryColor = "header_primary_color"
        case headerBackgroundColor = "header_background_color"
        case loginRequired = "login_required"
        case mobileLogoURL = "mobile_logo_url"
    }
}
