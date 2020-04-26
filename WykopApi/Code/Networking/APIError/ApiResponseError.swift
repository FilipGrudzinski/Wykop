//
//  ApiResponseError.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct ApiResponseError: Decodable, Error {
    let error: ErrorResponseModel
    
    struct ErrorResponseModel: Decodable, Error {
        
        let code: APIError
        let field: String?
        let messageEn: String?
        let messagePl: String?
    }
}
