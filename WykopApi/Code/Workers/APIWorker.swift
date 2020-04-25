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
    func fetchStreamList(_ pageNumber: Int) -> Promise<StreamListResponseModel>
}

final class APIWorker: APIWorkerProtocol {
    let provider = MoyaProvider<GeneralAPIService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func fetchPromotedList(_ pageNumber: Int) -> Promise<PromotedListResponseModel> {
        return provider.request(.promotedList(pageNumber), type: PromotedListResponseModel.self)
    }
    
    func fetchStreamList(_ pageNumber: Int) -> Promise<StreamListResponseModel> {
        return provider.request(.streamList(pageNumber), type: StreamListResponseModel.self)
    }
}
