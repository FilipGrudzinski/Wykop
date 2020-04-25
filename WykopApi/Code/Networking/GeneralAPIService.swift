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
    case streamList(Int)
}

extension GeneralAPIService: TargetType {
    private static let appKey = "appkey/gnr9daRtLW"
            
    var path: String {
        switch self {
        case let .promotedList(request):
            return "Links/Promoted/page/\(request)/\(GeneralAPIService.appKey)/data/full"
            
        case let .streamList(request):
            return "Entries/Stream/page/\(request)/\(GeneralAPIService.appKey)/data/full"
        }
    }
        
    var task: Task {
        switch self {
        case .promotedList, .streamList:
            return .requestPlain
        }
    }
}
