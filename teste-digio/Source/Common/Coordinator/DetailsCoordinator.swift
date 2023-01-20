//
//  DetailsCoordinator.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class DetailsCoordinator: BaseCoordinator {
    func start(
        details: DetailsModel,
        navigationController: UINavigationController?
    ) {
        DispatchQueue.main.async {
            guard let controller = self.getViewController(
                storyboardName: .details,
                controllerType: DetailsViewController.self
            ) else { return }
            let viewModel = DetailsViewModel(details: details)
            controller.setup(viewModel: viewModel)
            self.push(controller: controller, navigationController: navigationController)
        }
    }
}
