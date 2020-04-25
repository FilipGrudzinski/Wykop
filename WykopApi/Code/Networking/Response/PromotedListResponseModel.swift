//
//  PromotedListResponseModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct PromotedListResponseModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case pagination = "pagination"
        case data = "data"
    }
    
    let pagination: CommonPaginationResponseModel
    let data: [PromotedListDataResponseModel]
    
    struct PromotedListDataResponseModel: Decodable {
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case description = "description"
            case tags = "tags"
            case sourceUrl = "source_url"
            case buryCount = "bury_count"
            case voteCount = "vote_count"
            case commentsCount = "comments_count"
            case relatedCount = "related_count"
            case date = "date"
            case author = "author"
            case preview = "preview"
            case plus18 = "plus18"
            case status = "status"
            case canVote = "can_vote"
            case isHot = "is_hot"
            case app = "app"
            case comments = "comments"
            case userVote = "user_vote"
            case userFavorite = "user_favorite"
            case userObserve = "user_observe"
            case userLists = "user_lists"
            case isRecommended = "is_recommended"
        }
        
        let id: Int?
        let title: String?
        let description: String?
        let tags: String?
        let sourceUrl: String?
        let buryCount: Int?
        let voteCount: Int?
        let commentsCount: Int?
        let relatedCount: Int?
        let date: String?
        let author: CommonAuthorResponseModel?
        let preview: String?
        let plus18: Bool?
        let status: String?
        let canVote: Bool?
        let isHot: Bool?
        let app: String?
        let comments: PromotedListCommentsResponseModel?
        let userVote: Bool?
        let userFavorite: Bool?
        let userObserve: Bool?
        let userLists: [String]?
        let isRecommended: Bool?
        
        struct PromotedListCommentsResponseModel: Decodable { }
    }
}
