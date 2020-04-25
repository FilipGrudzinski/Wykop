//
//  DetailsViewModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

protocol DetailsViewModelProtocol: class {
    var delegate: DetailsViewModelDelegate! { get set }
    var title: String { get }
    
    func onViewDidLoad()
}

protocol DetailsViewModelDelegate: class {
    func activityIndicatorState(_ state: Bool)
}

final class DetailsViewModel {
    weak var delegate: DetailsViewModelDelegate!
    
    private let coordinator: MainCoordinatorProtocol
    
    private let urlString: String
    
    init(_ coordinator: MainCoordinatorProtocol, urlString: String) {
        self.urlString = urlString
        self.coordinator = coordinator
    }
}

extension DetailsViewModel: DetailsViewModelProtocol {
    var title: String { Localized.detailsViewTitle }

    func onViewDidLoad() {
    }
}
