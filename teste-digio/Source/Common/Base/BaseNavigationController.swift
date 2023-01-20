//
//  BaseNavigationController.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class BaseNavigationController: UINavigationController {
    // MARK: - Life Cycle

    public override var childForStatusBarStyle: UIViewController? {
        topViewController
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 13.0, *) {
            setGradient()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
        clearNavigation()
    }

    // MARK: - Private Methods

    @available(iOS 13.0, *)
    private func setGradient() {
        let largeTitleAppearance = UINavigationBarAppearance()
        largeTitleAppearance.configureWithTransparentBackground()
        largeTitleAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.digioColor]
        largeTitleAppearance.backgroundImage = UIImage()
        navigationBar.standardAppearance = largeTitleAppearance
        navigationBar.scrollEdgeAppearance = largeTitleAppearance
        navigationBar.barStyle = .default
    }
}
