// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сервис по загрузке данных
final class NetworkService: NetworkServiceProtocol {
    func fetchData(completion: @escaping (Result<Astronom, Error>) -> Void) {
        guard let url = URL(string: "https://go-apod.herokuapp.com/apod") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Astronom.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
