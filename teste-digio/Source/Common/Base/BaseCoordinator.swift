//
//  BaseCoordinator.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

class BaseCoordinator {
    // MARK: - Public Methods

    func getViewController<T: UIViewController>(
        storyboardName: StoryboardName,
        controllerType: T.Type
    ) -> T? {
        let storyBoard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let controller = storyBoard.instantiateInitialViewController() as? T
        return controller
    }

    func push(controller: UIViewController?, navigationController: UINavigationController?) {
        guard let controller = controller else { return }
        navigationController?.pushViewController(controller, animated: true)
    }
}
