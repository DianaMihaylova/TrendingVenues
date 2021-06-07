//
//  TrendingVenueTableViewCell.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import UIKit

class TrendingVenueTableViewCell: UITableViewCell, Configurable {

    // MARK: - Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var detailsImageView: UIImageView!
    @IBOutlet private weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = .black
        }
    }
 
    // MARK: - Configurable
    func configureWith(_ data: TrendingVenueCellData) {
        nameLabel.text = data.name
        detailsImageView.image = UIImage(named: data.imageName)
    }
    
}
