//
//  GeneralAPIService.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation
import Moya

enum GeneralAPIService {
    case promotedList(Int)
}

extension GeneralAPIService: TargetType {
    var path: String {
        switch self {
        case let .promotedList(request):
            return "Links/Promoted/page/\(request)/appkey/gnr9daRtLW"
        }
    }
        
    var task: Task {
        switch self {
        case .promotedList:
            return .requestPlain
        }
    }
}
