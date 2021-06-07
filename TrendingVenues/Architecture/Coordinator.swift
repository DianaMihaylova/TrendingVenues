//
//  Coordinator.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import Foundation

class Coordinator {
    
    private var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    
    init() { }
    
    /// Start The Coordinator
    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    /// Adds a child coordinator to the current childCoordinators array
    /// - Parameter coordinator: the coordinator to add
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    
}
