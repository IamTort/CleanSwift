// MainPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Презентер главного экрана
final class MainPresenter: MainPresentationLogic {
    // MARK: - Public Properties

    weak var viewController: MainDisplayLogic?

    // MARK: - Public methods

    func presentInitForm(_ response: MainModel.InitializationForm.Response) {
        let viewModel = MainModel.InitializationForm.ViewModel(placeholderImage: "", placeholderText: "InitText")
        viewController?.displayInitForm(viewModel)
    }

    func presentAstronomyInfo(_ response: MainModel.ShowInfo.Response) {
        let viewModel = MainModel.ShowInfo.ViewModel(imageData: response.imageData, description: response.description)
        viewController?.displayInfo(viewModel)
    }
}
