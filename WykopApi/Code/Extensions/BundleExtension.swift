//
//  StringExtensions.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

extension Bundle {
    static func loadNib<T>(_ owner: T) {
        main.loadNibNamed(String(describing: type(of: owner)), owner: owner, options: nil)
    }
}
