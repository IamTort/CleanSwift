// MainInteractor.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерактор главного экрана
final class MainInteractor: MainBusinessLogic, MainDataStore {
    // MARK: - Public Properties

    var modelInfo: Astronom?

    // MARK: - Private Properties

    private let worker: MainWorkerBusinessLogic
    private let presenter: MainPresentationLogic

    // MARK: - Initializer

    init(
        presenter: MainPresentationLogic,
        worker: MainWorkerBusinessLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: - Public methods

    func requestInitForm(_ request: MainModel.InitializationForm.Request) {
        let response = MainModel.InitializationForm.Response()
        presenter.presentInitForm(response)
    }

    func requestAstronomyInfo(_ request: MainModel.ShowInfo.Request) {
        worker.fetchAstronomyInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(model):
                self.modelInfo = model
                self.fetchImage(imagePath: model.url) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case let .success(data):
                        let response = MainModel.ShowInfo.Response(
                            imageData: data,
                            description: model.title
                        )
                        self.presenter.presentAstronomyInfo(response)
                    case let .failure(error):
                        print(error.localizedDescription)
                    }
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Private methods

    private func fetchImage(imagePath: String, completion: @escaping (Result<Data, Error>) -> ()) {
        worker.fetchImageData(imagePath: imagePath) { result in
            switch result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
