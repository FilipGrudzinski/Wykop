//
//  MainCoordinator.swift
//  WykopApi
//
//  Created by Filip Grudziński on 23/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import UIKit

protocol MainCoordinatorProtocol: CoordinatorProtocol {
    func showDetailsView(_ urlString: String)
}

final class MainCoordinator: MainCoordinatorProtocol {
    
    private let parentCoordinator: ApplicationParentCoordinatorProtocol
    private let navigationController = MainNavigationController()
    
    init(parentCoordinator: ApplicationParentCoordinatorProtocol) {
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let viewModel = MainViewModel(self)
        let viewController = MainViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
        
        parentCoordinator.showRootViewController(rootViewController: navigationController)
    }
    
    func showDetailsView(_ urlString: String) {
        let viewModel = DetailsViewModel(self, urlString: urlString)
        let viewController = DetailsViewController(with: viewModel)
        let modalNavigationController = CommonModalNavigationController(rootViewController: viewController)
        
        navigationController.present(modalNavigationController, animated: true)
    }
}
