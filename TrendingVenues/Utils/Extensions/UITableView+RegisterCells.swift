//
//  UITableView+RegisterCells.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import UIKit

extension UITableView {
    
    /// Register an array of cell names <"\(YourCellClass.self)"> to be reused
    /// - Parameter cellNames: The array of names
    func register(cellNames: [String]) {
        cellNames.forEach {
            register(UINib(nibName: $0, bundle: nil),
                     forCellReuseIdentifier: $0)
        }
    }
    
    /// Called in cellForRow atIndexPath. Configures the cell and returns it
    /// - Parameters:
    ///   - configurator: The configurator for the cell (from the viewModel)
    ///   - indexPath: The indexPath for the cell (from the dataSourceMethod - cellForRow)
    /// - Returns: An already configured UITableViewCell
    func configureCell(for configurator: ViewConfigurator, at indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: configurator.reuseIdentifier, for: indexPath)
        configurator.configure(cell)
        return cell
    }

}

