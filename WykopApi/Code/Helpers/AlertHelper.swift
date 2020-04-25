//
//  AlertHelper.swift
//  WykopApi
//
//  Created by Filip Grudziński on 25/04/2020.
//  Copyright © 2020 Filip Grudziński. All rights reserved.
//

import UIKit

enum AlertHelper {
    static let alert =  AlertService()
    
    case commonAlert(confirmHandler: ((Date) -> ())? = nil, cancelHandler: (() -> ())? = nil, dateHandler: ((Date) -> ())? = nil, controller: UIViewController)
    
    enum SubType {
        case commonAlert
    }
    
    func show() {
        switch self {
        case let .commonAlert(confirmHandler, cancelHandler, dateHandler, controller):
            AlertHelper.alert.create(type: .commonAlert, confirmHandler: confirmHandler, cancelHandler: cancelHandler, dateHandler: dateHandler, controller)
        }
    }
}

final class AlertService {
    
    @discardableResult
    func create(type: AlertHelper.SubType, confirmHandler: ((Date) -> ())?, cancelHandler: (() -> ())?, dateHandler: ((Date) -> ())?, _ controller: UIViewController) -> CommonViewController {
        switch type {
        case .commonAlert:
            return create(confirmHandler: confirmHandler, cancelHandler: cancelHandler, dateHandler: dateHandler, controller)
        }
    }
    
    private func create(confirmHandler: ((Date) -> ())?, cancelHandler: (() -> ())?, dateHandler: ((Date) -> ())?, _ controller: UIViewController) -> CommonViewController {
        let viewModel = CommonDatePickerViewModel(confirmHandler: confirmHandler, cancelHandler: cancelHandler, dateHandler: dateHandler)
        let inViewController = CommonDatePickerViewController(with: viewModel)
        controller.present(inViewController, animated: true)
        return inViewController
    }
}
