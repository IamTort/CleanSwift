// DetailModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель экрана деталей
enum DetailModel {
    enum InitializationForm {
        struct Request {}
        struct Response {
            let model: Astronom
        }

        struct ViewModel {
            let text: String
        }
    }

    enum DescriptionLabelChanged {
        struct Request {
            let editedText: String
        }

        struct Response {
            let editedText: String
        }

        struct ViewModel {
            let formattedText: String
        }
    }

    enum ToApp {
        struct Request {}
        struct Response {
            let ulrName: String
        }

        struct ViewModel {
            let url: URL
        }
    }
}
