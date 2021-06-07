//
//  BaseViewController+HideKeyboard.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import UIKit

extension BaseViewController {
    
    func addKeyboardDismissBehaviour() {
        let hideKeyboardTapGesture = UITapGestureRecognizer(target: self,
                                                            action: #selector(dismissKeyboard))
        hideKeyboardTapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(hideKeyboardTapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
