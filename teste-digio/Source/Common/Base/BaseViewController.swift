//
//  BaseViewController.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

protocol BaseControllerProtocol: AnyObject {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showShadowView()
    func hideShadowView()
    func showError(error: Error?)
}

class BaseViewController: UIViewController, BaseControllerProtocol {
    // MARK: - Private Properties

    private var shadowView: UIView?
    private var activityIndicatorView = UIActivityIndicatorView(
        style: UIActivityIndicatorView.Style.whiteLarge
    )

    // MARK: - Life Cycle

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNextViewControllerBackButtonnTitle(title: .empty)
        view.backgroundColor = .white
    }

    // MARK: - Public Methods

    func setNextViewControllerBackButtonnTitle(title: String) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title,
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
    }

    func showShadowView() {
        shadowView = UIView(frame: view.frame)
        shadowView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        view.addSubview(shadowView ?? UIView())
    }

    func hideShadowView() {
        shadowView?.removeFromSuperview()
    }

    func showActivityIndicator() {
        showShadowView()
        activityIndicatorView.color = .white
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()
        shadowView?.addSubview(activityIndicatorView)

        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.hideShadowView()
            self.activityIndicatorView.stopAnimating()
        }
    }

    func showError(error: Error?) {
        hideActivityIndicator()
        // TODO: - Criar Tela de erro
    }
}
