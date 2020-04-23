//
//  ActivityIndicator.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import UIKit

final class MainViewTableViewCell: UITableViewCell {
    private enum Constants {
        static let cornerRadius: CGFloat = 4.0
        static let shadowOpacity: Float = 1.0
        static let shadowRadius: CGFloat = 4.0
        static let shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    
    @IBOutlet private weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell() {
        setupShadow()
    }
    
    private func setupShadow() {
        shadowView.layer.cornerRadius = Constants.cornerRadius
        shadowView.layer.shadowColor = UIColor.appPastel.cgColor
        shadowView.layer.shadowOpacity = Constants.shadowOpacity
        shadowView.layer.shadowRadius = Constants.shadowRadius
        shadowView.layer.shadowOffset = Constants.shadowOffset
    }
    
    func setupData() {
    }
}
