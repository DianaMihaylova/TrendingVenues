//
//  TrendingVenueDetailsViewController.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import UIKit

class TrendingVenueDetailsViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    // MARK: - Properties
    private var viewModel: TrendingVenueDetailsViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .homeTurqouise
        viewModel.start()
    }
    
}

// MARK: - Make view controller function
extension TrendingVenueDetailsViewController {
    
    static func makeViewController(withViewModel viewModel: TrendingVenueDetailsViewModelProtocol) -> BaseViewController {
        let viewController = TrendingVenueDetailsViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}

// MARK: - TrendingVenueDetailsViewDelegate
extension TrendingVenueDetailsViewController: TrendingVenueDetailsViewDelegate {
    
    func set(urlString: String, name: String, address: String) {
        imageView.setImageFromUrl(urlString)
        nameLabel.text = name
        addressLabel.text = address
    }
    
}
