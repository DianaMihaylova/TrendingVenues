//
//  BaseDataSource.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import Foundation

protocol BaseDataSource {
    
    /// List of reuseIdentifiers of cell views.
    var reuseIdentifiers: [String] { get }
    
    /// Provides the number of sections in your table/collection view
    /// Defaults to 1
    var numberOfSections: Int { get }
    
    /// Provides the number of table/collection view cells for the given section
    /// - Parameter section: The given section
    /// - Returns: The number of cells from the viewModel
    func numberOfCellsInSection(_ section: Int) -> Int?
    
    /// Provides the viewConfigurator for your configurable table/collection view cell
    /// - Parameter index: The index path for the current cell
    /// - Parameter section: The section path for the current cell
    /// - Returns: A configurator from the viewModel
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator?
    
}

// MARK: - BaseDataSource+Defaults
extension BaseDataSource {
    
    var reuseIdentifiers: [String] {
        return []
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator? {
        return nil
    }
    
}
