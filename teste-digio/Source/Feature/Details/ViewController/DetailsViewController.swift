//
//  DetailsViewController.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class DetailsViewController: BaseViewController {
    // MARK: - Storyboard Outlets

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Private Properties

    private var viewModel: DetailsViewModel?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: - Public Methods

    func setup(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private Properties

    private func setupUI() {
        title = viewModel?.title
        viewModel?.getProductImage { image in
            DispatchQueue.main.async {
                self.productImageView.image = image
            }
        }
        viewModel?.getSpotlightImage { image in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        descriptionLabel.text = viewModel?.description
        imageView.isHidden = viewModel?.hideBanner ?? true
    }
}
