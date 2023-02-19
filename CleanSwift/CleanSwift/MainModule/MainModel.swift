// MainModel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Модель главного экрана
enum MainModel {
    enum InitializationForm {
        struct Request {}
        struct Response {}
        struct ViewModel {
            let placeholderImage: String
            let placeholderText: String
        }
    }

    enum ShowInfo {
        struct Request {}
        struct Response {
            let imageData: Data
            let description: String
        }

        struct ViewModel {
            let imageData: Data
            let description: String
        }
    }
}
