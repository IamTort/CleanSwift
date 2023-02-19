// MainWorker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Воркер главного экрана
final class MainWorker: MainWorkerBusinessLogic {
    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol
    private let imageService: ImageServiceProtocol

    // MARK: - Initializer

    init(networkService: NetworkServiceProtocol, imageService: ImageServiceProtocol) {
        self.networkService = networkService
        self.imageService = imageService
    }

    // MARK: - Public methods

    func fetchImageData(imagePath: String, completion: @escaping (Result<Data, Error>) -> ()) {
        imageService.fetchPicture { result in
            switch result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func fetchAstronomyInfo(completion: @escaping (Result<Astronom, Error>) -> ()) {
        networkService.fetchData { result in
            switch result {
            case let .success(model):
                completion(.success(model))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
