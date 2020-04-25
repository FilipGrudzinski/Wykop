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
    }
    
    let login: String?
    let color: Int?
    let sex: String?
    let avatar: URL?
}
