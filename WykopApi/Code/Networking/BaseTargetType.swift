//
//  BaseTargetType.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation
import Moya

extension TargetType {
    var baseURL: URL { URL(string: "https://a2.wykop.pl/")! }
    var headers: [String : String]? { ["Content-Type": "application/json"] }
    var method: Moya.Method { .get }
    var sampleData: Data { Data() }
}
