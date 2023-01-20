//
//  UINavigationController+.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

extension UINavigationController {
    func clearNavigation() {
        navigationBar.prefersLargeTitles = true
        navigationBar.tintColor = .digioColor
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
