//
//  DetailsViewController.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import UIKit
import WebKit

final class DetailsViewController: CommonViewController {
    @IBOutlet private weak var webView: WKWebView!
    
    private var viewModel: DetailsViewModelProtocol
    
    init(with viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHandlers()
        setupView()
        viewModel.onViewDidLoad()
    }
    
    private func setupViewHandlers() {
        viewModel.activityIndicatorUpdateHandler = { [weak self] state in
            state ? self?.activityIndicator.show() : self?.activityIndicator.hide()
        }
        
        viewModel.urlUpdateHandler = { [weak self] url in
            let request = URLRequest(url: url)
            self?.webView.load(request)
        }
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = viewModel.title
        activityIndicator.show()
    }
}
