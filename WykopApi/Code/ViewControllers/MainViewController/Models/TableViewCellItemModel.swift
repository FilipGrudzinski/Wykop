//
//  MainTableViewCellItemModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

struct TableViewCellItemModel {
    let style: CommonCellStyle
    let title: String
    let url: String
    var author: String? = .empty
    var imageUrl: URL?
}
