// MainProtocols.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол роутера главного экрана
protocol MainRoutingLogic {
    func routeToDetail()
}

/// Протокол интерактора главного экрана
protocol MainBusinessLogic {
    func requestInitForm(_ request: MainModel.InitializationForm.Request)
    func requestAstronomyInfo(_ request: MainModel.ShowInfo.Request)
}

/// Протокол сервисов главного экрана
protocol MainWorkerBusinessLogic {
    func fetchImageData(imagePath: String, completion: @escaping (Result<Data, Error>) -> ())
    func fetchAstronomyInfo(completion: @escaping (Result<Astronom, Error>) -> ())
}

/// Протокол презентера главного экрана
protocol MainPresentationLogic {
    func presentInitForm(_ response: MainModel.InitializationForm.Response)
    func presentAstronomyInfo(_ response: MainModel.ShowInfo.Response)
}

/// Протокол главного экрана
protocol MainDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: MainModel.InitializationForm.ViewModel)
    func displayInfo(_ viewModel: MainModel.ShowInfo.ViewModel)
}

/// Протокол данных  основного экрана
protocol MainDataStore {
    var modelInfo: Astronom? { get }
}
