// DetailRouter.swift
// Copyright © RoadMap. All rights reserved.

import StoreKit
import UIKit

final class DetailRouter: DetailRoutingLogic {
    // MARK: - Public Properties

    weak var viewController: UIViewController?

    // MARK: - Private Properties

    private let dataStore: DetailDataStore

    // MARK: - Initializer

    init(dataStore: DetailDataStore) {
        self.dataStore = dataStore
    }

    // MARK: - Public methods

    func routeToApp() {
        guard let url = URL(string: dataStore.deepLinkName) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            let storeViewController = SKStoreProductViewController()
            storeViewController.loadProduct(
                withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: Constants.deeplinkId)],
                completionBlock: nil
            )
            viewController?.present(storeViewController, animated: true)
        }
    }
}
