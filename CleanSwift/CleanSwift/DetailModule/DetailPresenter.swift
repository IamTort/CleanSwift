// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

final class DetailPresenter: DetailPresentationLogic {
    // MARK: - Public Properties

    weak var viewController: DetailDisplayLogic?

    // MARK: - Public methods

    func presentInitForm(_ response: DetailModel.InitializationForm.Response) {
        let viewModel = DetailModel.InitializationForm.ViewModel(text: response.model.title)
        viewController?.displayInitForm(viewModel)
    }

    func presentTitleChange(_ response: DetailModel.DescriptionLabelChanged.Response) {
        let formattedText = response.editedText.uppercased()
        let viewModel = DetailModel.DescriptionLabelChanged.ViewModel(formattedText: formattedText)
        viewController?.displayTitleChanged(viewModel)
    }

    func presentToApp(_ response: DetailModel.ToApp.Response) {
        guard let url = URL(string: response.ulrName) else { return }
        let viewModel = DetailModel.ToApp.ViewModel(url: url)
        viewController?.displayToApp(viewModel)
    }
}
