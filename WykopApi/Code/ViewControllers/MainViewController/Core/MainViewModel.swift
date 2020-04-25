//
//  MainViewController.swift
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
    func activityIndicatorState(_ state: Bool)
    func setSegment(_ index: Int)
    func reloadData()
    func setSegmentControlData(data: [String])
}

final class MainViewModel {
    weak var delegate: MainViewModelDelegate!
    
    private enum SegmentType: Int, CaseIterable {
        case main
        case blog
    }
    
    private let coordinator: MainCoordinatorProtocol
    private let worker: APIWorkerProtocol
    
    private var itemDataSource: [String] = []
    private let segmentDataSource = [Localized.mainViewFirstSegmentText, Localized.mainViewSecondSegmentText]
    
    init(_ coordinator: MainCoordinatorProtocol, worker: APIWorkerProtocol = APIWorker()) {
        self.worker = worker
        self.coordinator = coordinator
    }
    
    private func fetchPromotedData(_ page: Int) {
        worker.fetchPromotedList(page)
            .done { response in
                self.delegate.activityIndicatorState(false)
                print(response.pagination)
        }
        .catch { error in
            print(error)
        }
    }
    
    private func fetchStreamList(_ page: Int) {
        worker.fetchStreamList(page)
            .done { response in
                self.delegate.activityIndicatorState(false)
                print(response)
        }
        .catch { error in
            print(error)
        }
    }
}

extension MainViewModel: MainViewModelProtocol {
    var title: String { Localized.mainViewTitle }
    var dataSourceCount: Int { itemDataSource.count }
    
    func onViewDidLoad() {
        delegate.setSegmentControlData(data: segmentDataSource)
        delegate.setSegment(.zero)
        fetchPromotedData(.zero)
        delegate.reloadData()
    }
    
    func didTapSegment(_ index: Int) {
        switch SegmentType.allCases[index] {
        case .main:
            fetchPromotedData(.zero)
        case .blog:
            coordinator.showDetailsView("dsd")
            //fetchStreamList(.zero)
        }
    }
    
    func item(at indexPath: IndexPath) -> String {
        return itemDataSource[indexPath.row]
    }
    
    func didTapCell(at indexPath: IndexPath) {
        print(itemDataSource[indexPath.row])
    }
}
