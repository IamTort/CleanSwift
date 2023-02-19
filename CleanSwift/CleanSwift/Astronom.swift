// Astronom.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные о галактике
struct Astronom: Decodable {
    /// Название астрономического явления
    let title: String
    /// Ссылка на картинку
    let url: String
}
