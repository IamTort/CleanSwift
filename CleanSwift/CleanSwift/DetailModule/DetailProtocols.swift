// DetailProtocols.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол роутера экрана деталей
protocol DetailRoutingLogic {
    func routeToApp()
}

/// Протокол интерактора экрана деталей
protocol DetailBusinessLogic {
    func requestInitForm(_ request: DetailModel.InitializationForm.Request)
    func requestTitleChange(_ request: DetailModel.DescriptionLabelChanged.Request)
    func requestToApp(_ request: DetailModel.ToApp.Request)
}

/// Протокол сервиса экрана деталей
protocol DetailWorkerBusinessLogic {}

/// Протокол презентера экрана деталей
protocol DetailPresentationLogic {
    func presentInitForm(_ response: DetailModel.InitializationForm.Response)
    func presentTitleChange(_ response: DetailModel.DescriptionLabelChanged.Response)
    func presentToApp(_ response: DetailModel.ToApp.Response)
}

/// Протокол экрана деталей
protocol DetailDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: DetailModel.InitializationForm.ViewModel)
    func displayTitleChanged(_ viewModel: DetailModel.DescriptionLabelChanged.ViewModel)
    func displayToApp(_ viewModel: DetailModel.ToApp.ViewModel)
}

/// Протокол передачи данных с основного экрана
protocol DetailDataStore {
    var modelInfo: Astronom? { get }
    var deepLinkName: String { get }
}
