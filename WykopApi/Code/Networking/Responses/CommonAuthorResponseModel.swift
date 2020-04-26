//
//  CommonAuthorResponseModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct CommonAuthorResponseModel: Decodable {
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
