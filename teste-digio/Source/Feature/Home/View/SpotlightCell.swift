//
//  SpotlightCell.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class SpotlightCell: UICollectionViewCell {
    // MARK: - StoryBoard Outlets

    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Public Methods

    func setup(viewModel: SpotlightCellViewModel) {
        viewModel.getImage { image in
            DispatchQueue.main.async {
                self.imageView.image = image
                self.addShadow()
            }
        }
    }
}
