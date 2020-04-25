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
    func item(at indexPath: IndexPath) -> TableViewCellItemModel
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
        
        var cellStyle: CommonCellStyle {
            switch self {
            case .main:
                return .main
            case .blog:
                return .blog
            }
        }
    }
    
    private let coordinator: MainCoordinatorProtocol
    private let worker: APIWorkerProtocol
    
    private let segmentDataSource = [Localized.mainViewFirstSegmentText, Localized.mainViewSecondSegmentText]
    
    private var promotedApiDataSource: [PromotedListResponseModel.PromotedListDataResponseModel] = []
    private var streamApiDataSource: [StreamListResponseModel.StreamListCompactResponseModel] = []
    private var itemsDataSource: [TableViewCellItemModel] = []
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
                self.setupNextPageIfExist(response.pagination)
                self.parseDataToShow(.main)
        }
        .catch { error in
            print(error)
        }
    }
    
    private func fetchStreamList(_ page: Int) {
        worker.fetchStreamList(page)
            .done { response in
                self.delegate.activityIndicatorState(false)
                self.streamApiDataSource = response.data
                self.setupNextPageIfExist(response.pagination)
                self.parseDataToShow(.blog)
        }
        .catch { error in
            print(error)
        }
    }
    
    private func parseDataToShow(_ type: SegmentType) {
        switch type {
        case .main:
            guard promotedApiDataSource.isNotEmpty else {
                return
            }
            
            promotedApiDataSource.forEach { itemsDataSource.append(TableViewCellItemModel(style: type.cellStyle, title: $0.title, url: $0.url, imageUrl: $0.author?.avatar))
            }
            
            delegate.reloadData()
        case .blog:
            guard streamApiDataSource.isNotEmpty else {
                return
            }
            
            streamApiDataSource.forEach { itemsDataSource.append(TableViewCellItemModel(style: type.cellStyle, title: $0.body, url: $0.url, author: $0.author?.login, imageUrl: $0.author?.avatar))
            }

            delegate.reloadData()
        }
    }
    
    private func setupNextPageIfExist(_ data: CommonPaginationResponseModel ) {
        guard data.next != nil else {
            isNextPage = false
            return
        }
        
        loadedPage += Digit.one
    }
    
    private func resetPageParams() {
        loadedPage = Digit.one
        isNextPage = true
    }
}

extension MainViewModel: MainViewModelProtocol {
    var title: String { Localized.mainViewTitle }
    var dataSourceCount: Int { itemsDataSource.count }
    
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
        itemsDataSource.removeAll()
        delegate.reloadData()
        
        switch SegmentType.allCases[index] {
        case .main:
            resetPageParams()
            fetchPromotedData(Digit.one)
        case .blog:
            resetPageParams()
            fetchStreamList(Digit.one)
        }
    }
    
    func item(at indexPath: IndexPath) -> TableViewCellItemModel {
        return itemsDataSource[indexPath.row]
    }
    
    func didTapCell(at indexPath: IndexPath) {
        let itemUrl = itemsDataSource[indexPath.row].url
        coordinator.showDetailsView(itemUrl)
    }
}
