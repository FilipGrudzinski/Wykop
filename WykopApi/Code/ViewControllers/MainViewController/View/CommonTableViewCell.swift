//
//  CommonTableViewCell.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import UIKit
import Kingfisher

enum CommonCellStyle {
    case main
    case blog
}

final class CommonTableViewCell: UITableViewCell {
    private enum Constants {
        static let cornerRadius: CGFloat = 4.0
        static let shadowOpacity: Float = 0.1
        static let shadowRadius: CGFloat = 4.0
        static let shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    
    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var authorTitleLabel: UILabel!
    @IBOutlet private weak var authorValueLabel: UILabel!
    
    private var style: CommonCellStyle = .main {
        didSet {
            setupStyle()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadow()
    }
    
    private func setupShadow() {
        shadowView.layer.cornerRadius = Constants.cornerRadius
        shadowView.layer.shadowColor = UIColor.appBlue.cgColor
        shadowView.layer.shadowOpacity = Constants.shadowOpacity
        shadowView.layer.shadowRadius = Constants.shadowRadius
        shadowView.layer.shadowOffset = Constants.shadowOffset
    }
    
    func setupData(_ model: TableViewCellItemModel) {
        titleLabel.text = model.title
        authorValueLabel.text = model.author
        avatarImage.kf.setImage(with: model.imageUrl)
        
        style = model.style
    }
    
    private func setupStyle() {
        switch style {
        case .main:
            titleLabel.numberOfLines = .zero
            avatarImage.isHidden = true
            authorTitleLabel.isHidden = true
            authorValueLabel.isHidden = true
        case .blog:
            titleLabel.numberOfLines = Digit.three
            authorTitleLabel.text = Localized.commonCellAuthorLabelText
            authorValueLabel.font = .font(with: .regular, size: .medium)
            authorTitleLabel.textColor = .appBlue
            avatarImage.isHidden = false
            authorTitleLabel.isHidden = false
            authorValueLabel.isHidden = false
        }
    }
}
