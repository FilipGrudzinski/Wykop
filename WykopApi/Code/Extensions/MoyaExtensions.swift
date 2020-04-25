//
//  MoyaExtensions.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Moya
import SwiftyJSON
import PromiseKit

extension MoyaProvider where Target: TargetType {
    func request<U: Decodable>(_ target: Target, type: U.Type) -> Promise<U> {
        return Promise { resolver in
            request(target) { result in
                switch result {
                case let .success(response):
                    do {
                        do {
                            let errorResponse: ApiResponseError = try JSONDecoder().decode(ApiResponseError.self, from: response.data)
                            resolver.reject(errorResponse)
                        } catch {
                            let model: U = try JSONDecoder().decode(U.self, from: response.data)
                            resolver.fulfill(model)
                        }
                    } catch {
                        print(error)
                        do {
                            let errorResponse: ApiResponseError = try JSONDecoder().decode(ApiResponseError.self, from: response.data)
                            resolver.reject(errorResponse)
                        } catch {
                            resolver.reject(error)
                        }
                    }
                case let .failure(error):
                    resolver.reject(error)
                }
            }
        }
    }
}

extension MoyaProvider {
    static func errorResponse(_ value: Int) -> APIError {
        guard value == APIError.invalidAPIKey.rawValue else {
            return APIError.invalidAPIKey
        }
        return APIError.invalidAPIKey
    }
}
