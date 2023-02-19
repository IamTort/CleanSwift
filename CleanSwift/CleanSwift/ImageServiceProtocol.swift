// ImageServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол сервиса по загрузке картинок
protocol ImageServiceProtocol {
    func fetchPicture(completion: @escaping (Result<Data, Error>) -> Void)
}
