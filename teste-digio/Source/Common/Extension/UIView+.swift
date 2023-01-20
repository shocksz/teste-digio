//
//  UIView+.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(
        color: CGColor = UIColor.black.cgColor,
        offset: CGSize = CGSize(width: -5, height: 5),
        radius: Int = 2,
        opacity: Float = 0.15
    ) {
        layer.shadowColor = color
        layer.shadowOffset = offset
        layer.shadowRadius = CGFloat(radius)
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}
