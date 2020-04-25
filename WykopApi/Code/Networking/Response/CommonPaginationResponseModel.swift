//
//  CommonPaginationResponseModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct CommonPaginationResponseModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case next = "next"
    }
    
    let next: URL?
}
