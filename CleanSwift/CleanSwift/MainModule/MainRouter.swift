// MainRouter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Роутер главного экрана
final class MainRouter: MainRoutingLogic {
    // MARK: - Private Properties

    private let dataStore: MainDataStore

    // MARK: - Public Properties

    weak var viewController: UIViewController?

    // MARK: - Initializer

    init(dataStore: MainDataStore) {
        self.dataStore = dataStore
    }

    // MARK: - Public Methods

    func routeToDetail() {
        let detailViewController = DetailModuleBuilder.build(dataStore: dataStore)
        viewController?.navigationController?.pushViewController(
            detailViewController, animated: true
        )
    }
}
