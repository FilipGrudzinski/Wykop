//
//  CommonAuthorResponseModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct CommonAuthorResponseModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case color = "color"
        case sex = "sex"
        case avatar = "avatar"
        case signupAt = "signup_at"
        case background = "background"
        case isVerified = "is_verified"
        case isObserved = "is_observed"
        case isBlocked = "is_blocked"
        case email = "email"
        case about = "about"
        case name = "name"
        case www = "www"
        case jabber = "jabber"
        case gg = "gg"
        case city = "city"
        case facebook = "facebook"
        case twitter  = "twitter"
        case instagram = "instagram"
        case linksAddedCount = "links_added_count"
        case linksPublishedCount = "links_published_count"
        case comments_count = "comments_count"
        case rank = "rank"
        case followers = "followers"
        case following = "following"
        case entries = "entries"
        case entriesComments = "entries_comments"
        case diggs = "diggs"
        case buries = "buries"
        case violationUrl = "violation_url"
    }
    
    let login: String?
    let color: Int?
    let sex: String?
    let avatar: URL?
    let signupAt: String?
    let background: String?
    let isVerified: Bool?
    let isObserved: Bool?
    let isBlocked: Bool?
    let email: String?
    let about: String?
    let name: String?
    let www: String?
    let jabber: String?
    let gg: String?
    let city: String?
    let facebook: String?
    let twitter: String?
    let instagram: String?
    let linksAddedCount: Int?
    let linksPublishedCount: Int?
    let comments_count: Int?
    let rank: Int?
    let followers: Int?
    let following: Int?
    let entries: Int?
    let entriesComments: Int?
    let diggs: Int?
    let buries: Int?
    let violationUrl: String?
}
