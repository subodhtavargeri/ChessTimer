//
//  ShowPlayerTimerRouter.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 20/05/22.
//

import Foundation
protocol ShowPlayerTimerRouterProtocol: AnyObject {
    func routeToShowPlayerTimerViewController(viewController:ShowPlayerTimerViewController?)
}

final class ShowPlayerTimerRouter: ShowPlayerTimerRouterProtocol {
    func routeToShowPlayerTimerViewController(viewController:ShowPlayerTimerViewController?) {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
 
