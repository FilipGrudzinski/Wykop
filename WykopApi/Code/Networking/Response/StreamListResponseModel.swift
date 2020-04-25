//
//  StreamListResponseModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct StreamListResponseModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case pagination = "pagination"
        case data = "data"
    }
    
    let pagination: CommonPaginationResponseModel
    let data: [StreamListCompactResponseModel]
    
    struct StreamListCompactResponseModel: Decodable {
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case date = "date"
            case body = "body"
            case author = "author"
            case receiver = "receiver"
            case blocked = "blocked"
            case favorite = "favorite"
            case voteCount = "vote_count"
            case commentsCount = "comments_count"
            case comment = "comment"
            case status = "status"
            case embed = "embed"
            case survey = "survey"
            case canComment = "can_comment"
            case userVote = "user_vote"
            case app = "app"
            case violationUrl = "violation_url"
            case original = "original"
            case url = "url"
        }
        
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
