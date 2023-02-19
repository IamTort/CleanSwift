// NetworkServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол сервиса по загрузке данных
protocol NetworkServiceProtocol {
    func fetchData(completion: @escaping (Result<Astronom, Error>) -> Void)
}
