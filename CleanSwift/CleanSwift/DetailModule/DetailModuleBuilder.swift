// DetailModuleBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cборщик экрана деталей
enum DetailModuleBuilder {
    static func build(dataStore: MainDataStore) -> UIViewController {
        let presenter = DetailPresenter()
        let interactor = DetailInteractor(presenter: presenter, deepLinkName: Constants.deeplinkString)
        interactor.modelInfo = dataStore.modelInfo
        let router = DetailRouter(dataStore: interactor)
        let viewController = DetailViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
