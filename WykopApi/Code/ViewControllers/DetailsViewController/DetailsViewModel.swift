//
//  DetailsViewModel.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

protocol DetailsViewModelProtocol: class {
    var title: String { get }
    var urlToShare: [String] { get }
    
    var activityIndicatorUpdateHandler: ((Bool) -> ())? { get set }
    var urlUpdateHandler: ((URL) -> ())? { get set }
    
    func onViewDidLoad()
}

protocol DetailsViewModelDelegate: class {
    func activityIndicatorState(_ state: Bool)
}

final class DetailsViewModel {
    private let coordinator: MainCoordinatorProtocol
    
    private let urlString: String
    
    var activityIndicatorUpdateHandler: ((Bool) -> ())?
    var urlUpdateHandler: ((URL) -> ())?
    
    init(_ coordinator: MainCoordinatorProtocol, urlString: String) {
        self.urlString = urlString
        self.coordinator = coordinator
    }
}

extension DetailsViewModel: DetailsViewModelProtocol {
    var title: String { Localized.detailsViewTitle }
    var urlToShare: [String] { [urlString] }
    
    func onViewDidLoad() {
        activityIndicatorUpdateHandler?(false)
        
        guard let url = URL(string: urlString) else {
            return
        }
        

        urlUpdateHandler?(url)
    }
}
