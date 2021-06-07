//
//  UIImageView+URL.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 7.06.21.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImageFromUrl(_ urlString: String) {
        let url = URL(string: urlString)
        self.kf.setImage(with: url)
    }
    
}
