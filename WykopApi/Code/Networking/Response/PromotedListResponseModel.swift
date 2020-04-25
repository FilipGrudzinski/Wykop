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
    
    let pagination: PromotedListNextResponseModel
    let data: [PromotedListDataResponseModel]
    
    struct PromotedListNextResponseModel: Decodable {
        enum CodingKeys: String, CodingKey {
            case next = "next"
        }
        
        let next: URL?
    }
    
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
        }
        
        let id: Int?
        let title: String?
        let description: String?
        let tags: String?
        let sourceUrl: URL?
        let buryCount: Int?
        let voteCount: Int?
        let commentsCount: Int?
        let relatedCount: Int?
        let date: String?
        let author: PromotedListAuthorResponseModel?
        let preview: URL?
        let plus18: Bool?
        let status: String?
        let canVote: Bool?
        let isHot: Bool?
        let app: String?
        
        struct PromotedListAuthorResponseModel: Decodable {
            enum CodingKeys: String, CodingKey {
                case login = "login"
                case color = "color"
                case sex = "sex"
                case avatar = "avatar"
            }
            
            let login: String?
            let color: Int?
            let sex: String?
            let avatar: URL?
        }
    }
}
