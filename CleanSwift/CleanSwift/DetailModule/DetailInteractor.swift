// DetailInteractor.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерактор экрана деталей
final class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    // MARK: - Public Properties

    var modelInfo: Astronom?
    var deepLinkName: String

    // MARK: - Private Properties

    private let presenter: DetailPresentationLogic

    // MARK: - Initializers

    init(presenter: DetailPresentationLogic, deepLinkName: String) {
        self.presenter = presenter
        self.deepLinkName = deepLinkName
    }

    // MARK: - Public methods

    func requestInitForm(_ request: DetailModel.InitializationForm.Request) {
        guard let modelInfo = modelInfo else { return }
        let response = DetailModel.InitializationForm.Response(model: modelInfo)
        presenter.presentInitForm(response)
    }

    func requestTitleChange(_ request: DetailModel.DescriptionLabelChanged.Request) {
        let response = DetailModel.DescriptionLabelChanged.Response(editedText: request.editedText)
        presenter.presentTitleChange(response)
    }

    func requestToApp(_ request: DetailModel.ToApp.Request) {
        let response = DetailModel.ToApp.Response(ulrName: deepLinkName)
        presenter.presentToApp(response)
    }
}
