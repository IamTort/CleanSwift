// MainModuleBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cборщик главного экрана
enum MainModuleBuilder {
    static func build() -> UIViewController {
        let presenter = MainPresenter()
        let networkService = NetworkService()
        let imageService = ImageService()
        let worker = MainWorker(networkService: networkService, imageService: imageService)
        let interactor = MainInteractor(presenter: presenter, worker: worker)
        let router = MainRouter(dataStore: interactor)
        let viewController = MainViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
