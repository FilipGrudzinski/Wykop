//
//  ApiError.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

enum APIError: Int, CaseIterable, Error {
    case invalidAPIKey = 1
    
    var message: String {
        switch self {
        case .invalidAPIKey:
            return Localized.invalidAPIKeyError
        }
    }
}
