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
    func loadMoreData(_ index: Int)
    func didTapSegment(_ index: Int)
    func item(at indexPath: IndexPath) -> MainTableViewCellItemModel
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
    
    private let segmentDataSource = [Localized.mainViewFirstSegmentText, Localized.mainViewSecondSegmentText]
    
    private var promotedApiDataSource: [PromotedListResponseModel.PromotedListDataResponseModel] = []
    private var promotedCellItems: [MainTableViewCellItemModel] = []
    private var loadedPage = Digit.one
    private var isNextPage = true
    
    init(_ coordinator: MainCoordinatorProtocol, worker: APIWorkerProtocol = APIWorker()) {
        self.worker = worker
        self.coordinator = coordinator
    }
    
    private func fetchPromotedData(_ page: Int) {
        worker.fetchPromotedList(page)
            .done { response in
                self.delegate.activityIndicatorState(false)
                self.promotedApiDataSource = response.data
                self.setupNextPageIfExist(response)
                self.parsePromotedToShow()
        }
        .catch { error in
            print(error)
        }
    }
    
    private func parsePromotedToShow() {
        guard promotedApiDataSource.isNotEmpty else {
            return
        }
        
        promotedApiDataSource.forEach { promotedCellItems.append(MainTableViewCellItemModel(title: $0.title, url: $0.url))
        }
        
        delegate.reloadData()
    }
    
    private func setupNextPageIfExist(_ data: PromotedListResponseModel ) {
        guard data.pagination.next != nil else {
            isNextPage = false
            return
        }
        
        loadedPage += Digit.one
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
    var dataSourceCount: Int { promotedCellItems.count }
    
    func onViewDidLoad() {
        delegate.setSegmentControlData(data: segmentDataSource)
        delegate.setSegment(.zero)
        fetchPromotedData(Digit.one)
    }
    
    func loadMoreData(_ index: Int) {
        let lastElement = dataSourceCount - Digit.one
        
        guard index == lastElement, isNextPage else {
            return
        }
        
        fetchPromotedData(loadedPage)
    }
    
    func didTapSegment(_ index: Int) {
        switch SegmentType.allCases[index] {
        case .main:
            fetchPromotedData(Digit.one)
        case .blog:
            fetchStreamList(Digit.one)
        }
    }
    
    func item(at indexPath: IndexPath) -> MainTableViewCellItemModel {
        return promotedCellItems[indexPath.row]
    }
    
    func didTapCell(at indexPath: IndexPath) {
        let itemUrl = promotedCellItems[indexPath.row].url
        coordinator.showDetailsView(itemUrl)
    }
}
