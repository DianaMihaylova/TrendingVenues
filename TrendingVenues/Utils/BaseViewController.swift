//
//  BaseViewController.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 6.06.21.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    /// Called on receiving system notification `keyboardWillShowNotification`.
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardWillShowWithHeight(keyboardSize.height)
        }
    }
    
    /// Called on receiving system notification `keyboardWillShowNotification` with calculated keyboard height.
    /// - Parameter height: `CGFloat` height of the keyboard to be shown.
    func keyboardWillShowWithHeight(_ height: CGFloat) {}
    
    /// Called on receiving system notification `keyboardWillHideNotification`.
    @objc func keyboardWillHide(notification: Notification) {}
    
}
