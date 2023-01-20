//
//  ProductCell.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class ProductCell: UICollectionViewCell {
    // MARK: - StoryBoard Outlets

    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Public Methods

    func setup(viewModel: ProductCellViewModel) {
        viewModel.getImage { image in
            DispatchQueue.main.async {
                self.imageView.image = image
                self.addShadow(offset: CGSize(width: 0, height: 0),
                               radius: 4,
                               opacity: 0.25)
            }
        }
    }
}
