// ImageService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сервис по загрузке картинок
final class ImageService: ImageServiceProtocol {
    func fetchPicture(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://go-apod.herokuapp.com/image") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error == nil {
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}
