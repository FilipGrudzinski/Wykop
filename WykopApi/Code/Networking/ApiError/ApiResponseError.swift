//
//  ApiResponseError.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct ApiResponseError: Decodable, Error {
    enum CodingKeys: String, CodingKey {
        case error = "error"
    }
    
    let error: ErrorResponseModel
    
    struct ErrorResponseModel: Decodable, Error {
        
        enum CodingKeys: String, CodingKey {
            case code = "code"
            case field = "field"
            case messageEn = "message_en"
            case messagePl = "message_pl"
        }
        
        let code: APIError
        let field: String?
        let messageEn: String?
        let messagePl: String?
    }
}
