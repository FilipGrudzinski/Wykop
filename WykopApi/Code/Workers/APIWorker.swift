//
//  APIWorker.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Moya
import Alamofire
import PromiseKit
import SwiftyJSON

protocol APIWorkerProtocol {
    func fetchPromotedList(_ pageNumber: Int) -> Promise<PromotedListResponseModel>
}

final class APIWorker: APIWorkerProtocol {
    let provider = MoyaProvider<GeneralAPIService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func fetchPromotedList(_ pageNumber: Int) -> Promise<PromotedListResponseModel> {
        return provider.request(.promotedList(pageNumber), type: PromotedListResponseModel.self)
    }
}
