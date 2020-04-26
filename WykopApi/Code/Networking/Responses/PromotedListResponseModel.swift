//
//  PromotedListResponseModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct PromotedListResponseModel: Decodable {
    let pagination: CommonPaginationResponseModel
    let data: [PromotedListDataResponseModel]
    
    struct PromotedListDataResponseModel: Decodable {
        let id: Int
        let title: String
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
        let url: String
        
        struct PromotedListCommentsResponseModel: Decodable { }
    }
}
