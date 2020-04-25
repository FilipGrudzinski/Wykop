//
//  MainNavigationController.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let backButton = UIBarButtonItem(title: .empty, style: .plain, target: nil, action: nil)
        topViewController?.navigationItem.backBarButtonItem = backButton
        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appBlue]
        navigationBar.tintColor = .appBlue
    }
}
