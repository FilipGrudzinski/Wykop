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
    var dataSourceCount: Int { get }
    
    func onViewDidLoad()
    func didTapSegment(_ index: Int)
    func item(at indexPath: IndexPath) -> String
    func didTapCell(at indexPath: IndexPath)
}

protocol MainViewModelDelegate: class {
    func setSegment(_ index: Int)
    func reloadData()
    func setSegmentControlData(data: [String])
}

final class MainViewModel {
    weak var delegate: MainViewModelDelegate!
    
    private let coordinator: MainCoordinatorProtocol
    
    private var segmentDataSource: [String] = []
    private let itemDataSource = [Localized.mainViewFirstSegmentText, Localized.mainViewSecondSegmentText]
    
    init(_ coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

extension MainViewModel: MainViewModelProtocol {
    var title: String { Localized.mainViewTitle }
    var dataSourceCount: Int { itemDataSource.count }

    func onViewDidLoad() {
        delegate.setSegmentControlData(data: segmentDataSource)
        delegate.setSegment(.zero)
    }
    
    func didTapSegment(_ index: Int) {
        #warning("ToDo")
    }
    
    func item(at indexPath: IndexPath) -> String {
        return itemDataSource[indexPath.row]
    }
    
    func didTapCell(at indexPath: IndexPath) {
        print(itemDataSource[indexPath.row])
    }
}
