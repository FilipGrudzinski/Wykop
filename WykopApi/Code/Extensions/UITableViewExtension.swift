//
//  StringExtensions.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCellByNib<T: UITableViewCell>(_ cellClass: T.Type) {
        register(UINib(nibName: String(describing: cellClass), bundle: nil), forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
