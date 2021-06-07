//
//  TrendingVenuesHomeViewController.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import UIKit

class TrendingVenuesHomeViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.barTintColor = .homeTurqouise
        }
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(cellNames: viewModel.reuseIdentifiers)
        }
    }
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.style = .large
            activityIndicatorView.color = .yellow
            activityIndicatorView.isHidden = true
        }
    }
    @IBOutlet private weak var noDataLabel: UILabel! {
        didSet {
            noDataLabel.isHidden = true
        }
    }
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint! {
        didSet {
            bottomConstraintConstant = bottomConstraint.constant
        }
    }
    
    // MARK: - Properties
    private var viewModel: TrendingVenuesHomeViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    private var bottomConstraintConstant: CGFloat!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardDismissBehaviour()
        setupBackgrounds()
        viewModel.start()
    }
    
    // MARK: - Keyboard
    override func keyboardWillShowWithHeight(_ height: CGFloat) {
        super.keyboardWillShowWithHeight(height)
        bottomConstraint.constant = height +
            Constants.aboveKeyboardSpacing -
            bottomConstraintConstant
    }
    
    @objc override func keyboardWillHide(notification: Notification) {
        super.keyboardWillHide(notification: notification)
        bottomConstraint.constant = bottomConstraintConstant
    }
    
    // MARK: - Private
    private func setupBackgrounds() {
        view.backgroundColor = .homeTurqouise
        navigationController?.navigationBar.barTintColor = .homeTurqouise
    }
    
}

// MARK: - Make view controller function
extension TrendingVenuesHomeViewController {
    
    static func makeViewController(withViewModel viewModel: TrendingVenuesHomeViewModelProtocol) -> BaseViewController {
        let viewController = TrendingVenuesHomeViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}

// MARK: - TrendingVenuesHomeViewDelegate
extension TrendingVenuesHomeViewController: TrendingVenuesHomeViewDelegate {
    
    func reloadData() {
        noDataLabel.isHidden = true
        tableView.reloadData()
    }
    
    func activateIndicator(_ shouldActivate: Bool) {
        activityIndicatorView.isHidden = !shouldActivate
        shouldActivate ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
    }
    
    func setEmptyDataText(_ text: String) {
        noDataLabel.isHidden = false
        noDataLabel.text = text
    }
    
}

// MARK: - UITableViewDataSource
extension TrendingVenuesHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCellsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configurator = viewModel.viewConfigurator(at: indexPath.row, in: indexPath.section) else { return UITableViewCell() }
        return tableView.configureCell(for: configurator, at: indexPath)
    }
    
}

// MARK: - UITableViewDelegate
extension TrendingVenuesHomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let configurator = viewModel.viewConfigurator(at: indexPath.row, in: indexPath.section)
        configurator?.didSelectAction?()
    }
    
}

// MARK: - UISearchBarDelegate
extension TrendingVenuesHomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
