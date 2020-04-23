//
//  ActivityIndicator.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import UIKit

final class MainViewController: CommonViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    
    private var viewModel: MainViewModelProtocol
    
    init(with viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        viewModel.onViewDidLoad()
    }
    
    @IBAction func segementControlAction(_ sender: Any) {
        activityIndicator.show()
        viewModel.didTapSegment(segmentControl.selectedSegmentIndex)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = viewModel.title
        setupTableView()
        activityIndicator.show()
    }
    
    private func setupTableView() {
        tableView.registerCellByNib(MainViewTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelectionDuringEditing = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didTapCell(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSourceCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainViewTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        return cell
    }
}

extension MainViewController: MainViewModelDelegate {
    func reloadData() {
        activityIndicator.hide()
        tableView.reloadData()
    }
    
    func setSegment(_ index: Int) {
        segmentControl.selectedSegmentIndex = index
    }
    
    func setSegmentControlData(data: [String]) {
        segmentControl.removeAllSegments()
        data.enumerated().forEach { (index , element) in segmentControl.insertSegment(withTitle: element, at: index, animated: false) }
    }
}
