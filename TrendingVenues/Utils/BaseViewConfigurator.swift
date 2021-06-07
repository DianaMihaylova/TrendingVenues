//
//  BaseViewConfigurator.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import UIKit

protocol Configurable {
    
    associatedtype DataType
    
    /// Every cell/view should conform to configurable if it needs Data passed to it
    /// example: func configureWith(_ data: String) will take just one string as value
    /// - Parameter data: The data with generic associatedType passed to it
    func configureWith(_ data: DataType)

}

protocol ViewConfigurator {
    
    /// ReuseId of the cell or nib name of the view
    var reuseIdentifier: String { get }
    
    /// Should be used for didSelect action
    var didSelectAction: (() -> Void)? { get set }
    
    /// Call the configurator.configure(your cell/view)
    /// - Parameter view: The UIView/UITableViewCell/UICollectionViewCell that the configurator handles
    func configure(_ view: UIView)
    
}

class BaseViewConfigurator<ConfigurableType: Configurable>: ViewConfigurator {
    
    class var reuseIdentifier: String { return String(describing: ConfigurableType.self) }
    var reuseIdentifier: String { return Self.reuseIdentifier }
    var didSelectAction: (() -> Void)?
    var data: ConfigurableType.DataType
    
    /// Initialize the viewConfigurator with the data of the proper type
    /// - Parameter data: This Data needs to be the same data as the one the configurableCell expects
    init(data: ConfigurableType.DataType, didSelectAction: (() -> Void)? = nil) {
        self.data = data
        self.didSelectAction = didSelectAction
    }
    
   func configure(_ view: UIView) {
        guard let configurableView = view as? ConfigurableType else { return }
        configurableView.configureWith(data)
    }

}
