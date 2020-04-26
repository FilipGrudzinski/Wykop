//
//  StreamListResponseModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct StreamListResponseModel: Decodable {
    let pagination: CommonPaginationResponseModel
    let data: [StreamListCompactResponseModel]
    
    struct StreamListCompactResponseModel: Decodable {
        let id: Int
        let date: String?
        var body: String?
        let author: CommonAuthorResponseModel?
        let receiver: StreamListCompactReceiverResponseModel?
        let blocked: Bool?
        let favorite: Bool?
        let voteCount: Int?
        let commentsCount: Int?
        let comment: StreamListCommentsResponseModel?
        let status: String?
        let embed: StreamListEmbedResponseModel?
        let survey: StreamListSurveyResponseModel?
        let canComment: Bool?
        let userVote: Int?
        let app: String?
        let violationUrl: String?
        let original: String?
        let url: String
        
        struct StreamListCompactReceiverResponseModel: Decodable { }
        struct StreamListCommentsResponseModel: Decodable { }
        struct StreamListEmbedResponseModel: Decodable { }
        struct StreamListSurveyResponseModel: Decodable { }
    }
}
