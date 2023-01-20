//
//  HomeViewController.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import UIKit

final class HomeViewController: BaseViewController {
    // MARK: - Storyboard Outlets

    @IBOutlet weak var bannerWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var productsCollectionView: UICollectionView!
    @IBOutlet private weak var productsLabel: UILabel!
    @IBOutlet private weak var bannerImageView: UIImageView!
    @IBOutlet private weak var bannerLabel: UILabel!
    @IBOutlet private weak var spotlightCollectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var digioLogoImageView: UIImageView!

    // MARK: Private Properties

    private let viewModel = HomeViewModel()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchModel()
        setNextViewControllerBackButtonnTitle(title: "Home")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // MARK: - Private Methods

    private func setupCollectionViews() {
        DispatchQueue.main.async {
            self.productsCollectionView.delegate = self
            self.productsCollectionView.dataSource = self
            self.spotlightCollectionView.delegate = self
            self.spotlightCollectionView.dataSource = self
            self.spotlightCollectionView.register(
                UINib(nibName: CellReuseIdentifier.homeSpotlightCell.rawValue,
                      bundle: nil),
                forCellWithReuseIdentifier: CellReuseIdentifier.homeSpotlightCell.rawValue
            )
            self.productsCollectionView.register(
                UINib(nibName: CellReuseIdentifier.homeProductCell.rawValue,
                      bundle: nil),
                forCellWithReuseIdentifier: CellReuseIdentifier.homeProductCell.rawValue
            )
        }
    }

    private func fetchModel() {
        showActivityIndicator()
        viewModel.getHomeModel(
            success: {
                self.setupUI()
                self.setupCollectionViews()
                self.hideActivityIndicator()
            },
            failure: { error in
                self.showError(error: error)
            }
        )
    }

    private func setupUI() {
        DispatchQueue.main.async {
            self.bannerWidthConstraint.constant = self.viewModel.getBannerSize(
                screenSize: self.view.bounds.size
            ).width
            self.bannerLabel.attributedText = self.viewModel.digioAttributedString
        }
        viewModel.getBannerImage { image in
            DispatchQueue.main.async {
                self.bannerImageView.image = image
            }
        }
    }

    // MARK: - Storyboard Actions

    @IBAction func digioCashDidTapped(_ sender: Any) {
        let details = viewModel.getDetailsFromBanner()
        DetailsCoordinator().start(details: details,
                                   navigationController: navigationController)
    }
}

// MARK: - CollectionView Extension

extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        switch collectionView {
        case spotlightCollectionView:
            return viewModel.numberOfSpotlight

        case productsCollectionView:
            return viewModel.numberOfProducts

        default:
            return 0
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch collectionView {
        case spotlightCollectionView:
            let identifier = CellReuseIdentifier.homeSpotlightCell.rawValue
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: identifier,
                    for: indexPath
                ) as? SpotlightCell,
                let spotlight = viewModel.getSpotlight(at: indexPath.row)
            else { return UICollectionViewCell() }
            let cellViewModel = SpotlightCellViewModel(spotlight: spotlight)
            cell.setup(viewModel: cellViewModel)
            return cell

        case productsCollectionView:
            let identifier = CellReuseIdentifier.homeProductCell.rawValue
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: identifier,
                    for: indexPath
                ) as? ProductCell,
                let product = viewModel.getProduct(at: indexPath.row)
            else { return UICollectionViewCell() }
            let cellViewModel = ProductCellViewModel(product: product)
            cell.setup(viewModel: cellViewModel)
            return cell

        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let detailsType: DetailsType = collectionView == productsCollectionView ? .product : .banner
        let details = viewModel.getDetailsModel(at: indexPath.row, type: detailsType)
        DetailsCoordinator().start(details: details,
                                   navigationController: navigationController)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch collectionView {
        case spotlightCollectionView:
            return viewModel.getSpotlightCellSize(screenSize: self.view.bounds.size)

        case productsCollectionView:
            return viewModel.productCellSize

        default:
            return CGSize()
        }
    }
}
