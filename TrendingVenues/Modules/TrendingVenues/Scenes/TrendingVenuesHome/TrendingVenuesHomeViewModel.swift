//
//  TrendingVenuesHomeViewModel.swift
//  TrendingVenues
//
//  Created by Diana R. MIHAYLOVA on 5.06.21.
//

import Foundation

private extension Constants {
    static let longitude = 23.319941
    static let latitude = 42.698334
    static let limit = 50
    static let radius = 2000
    static let yearMonthDay = "yyyyMMdd"
    static let imageName = "details_icon"
    static let noDataText = "No available trending venues here!"
}

class TrendingVenuesHomeViewModel: TrendingVenuesHomeViewModelProtocol {
    
    typealias TrendingTableViewConfigurator = BaseViewConfigurator<TrendingVenueTableViewCell>
    
    // MARK: - Properties
    weak var delegate: TrendingVenuesHomeViewDelegate?
    private let coordinator: TrendingVenuesHomeCoordinatorDelegate
    private let repository: HomeRepositoryProtocol
    private var configurators: [ViewConfigurator] = []
    private var cashedConfigurators: [ViewConfigurator] = []
    private var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.yearMonthDay
        return dateFormatter.string(from: Date())
    }
    
    // MARK: - View model
    init(coordinator: TrendingVenuesHomeCoordinatorDelegate,
         repository: HomeRepositoryProtocol) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    // MARK: - CoordinatableViewModel
    func start() {
        requestTrendingVenues()
    }
    
    // MARK: - BaseDataSource
    var reuseIdentifiers: [String] {
        return [TrendingTableViewConfigurator.reuseIdentifier]
    }
    
    func numberOfCellsInSection(_ section: Int) -> Int? {
        return configurators.count
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator? {
        guard index > 0,
              index < configurators.count else { return nil }
        return configurators[index]
    }
    
    // MARK: - TrendingVenuesHomeViewModelProtocol
    func search(with text: String) {
        guard !text.isEmpty else {
            configurators = cashedConfigurators
            delegate?.reloadData()
            return
        }
        generateResults(for: text)
    }
    
    // MARK: - Private
    private func requestTrendingVenues() {
        var viewConfigs: [ViewConfigurator] = []
        delegate?.activateIndicator(true)
        repository.getTrendingVenues(lng: Constants.longitude,
                                     lat: Constants.latitude,
                                     limit: Constants.limit,
                                     radius: Constants.radius,
                                     dateString: dateString) { [weak self] data in
            self?.delegate?.activateIndicator(false)
            guard let self = self,
                  let venues = data?.response.venues else { return }
            if venues.isEmpty {
                self.delegate?.setEmptyDataText(Constants.noDataText)
            } else {
                venues.forEach { venue in
                    let didSelectAction: () -> Void =  { [weak self] in
                        self?.coordinator.continueWithDetails(with: venue)
                    }
                    viewConfigs.append(TrendingTableViewConfigurator(data: TrendingVenueCellData(name: venue.name,
                                                                                                 imageName: Constants.imageName),
                                                                     didSelectAction: didSelectAction))
                }
                self.configurators = viewConfigs
                self.cashedConfigurators = viewConfigs
                self.delegate?.reloadData()
            }
        }
    }
    
    private func generateResults(for text: String) {
        let searchResults = configurators.filter({ trendingConfigurator -> Bool in
            guard let configuratorData = (trendingConfigurator as? TrendingTableViewConfigurator)?.data else { return false }
            return configuratorData.name.contains(text)
        })
        configurators = searchResults
        delegate?.reloadData()
    }
    
}
