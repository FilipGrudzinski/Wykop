//
//  ActivityIndicator.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol: class {
    var delegate: MainViewModelDelegate! { get set }
    var title: String { get }
}

protocol MainViewModelDelegate: class {

}

final class MainViewModel {
    weak var delegate: MainViewModelDelegate!
    
    private let coordinator: MainCoordinatorProtocol
    
    init(_ coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    

}

extension MainViewModel: MainViewModelProtocol {
    var title: String { Localized.mainViewTitle }

}
