// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран деталей
class DetailViewController: UIViewController {
    // MARK: - Private Enum

    private enum Constants {
        static let errorString = "init(coder:) has not been implemented"
        static let changeButtonString = "Изменить текст"
        static let toAppButtonString = "Перейти к приложению"
        static let emptyString = ""
    }

    // MARK: - Private Visual Components

    private lazy var changeTextButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle(Constants.changeButtonString, for: .normal)
        button.tintColor = .blue
        button.addTarget(self, action: #selector(changeTextAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var toAppButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle(Constants.toAppButtonString, for: .normal)
        button.tintColor = .blue
        button.addTarget(self, action: #selector(toAppAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Private Properties

    private let interactor: DetailBusinessLogic
    private let router: DetailRoutingLogic

    // MARK: - Initializers

    init(
        interactor: DetailBusinessLogic,
        router: DetailRoutingLogic
    ) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.errorString)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initializationForm()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(changeTextButton)
        view.addSubview(toAppButton)
        createConstraints()
    }

    private func createConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),

            changeTextButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            changeTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeTextButton.heightAnchor.constraint(equalToConstant: 50),
            changeTextButton.widthAnchor.constraint(equalToConstant: 300),

            toAppButton.topAnchor.constraint(equalTo: changeTextButton.bottomAnchor, constant: 30),
            toAppButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toAppButton.heightAnchor.constraint(equalToConstant: 50),
            toAppButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    private func initializationForm() {
        let request = DetailModel.InitializationForm.Request()
        interactor.requestInitForm(request)
    }

    @objc private func changeTextAction() {
        let request = DetailModel.DescriptionLabelChanged.Request(editedText: titleLabel.text ?? Constants.emptyString)
        interactor.requestTitleChange(request)
    }

    @objc private func toAppAction() {
        let request = DetailModel.ToApp.Request()
        interactor.requestToApp(request)
    }
}

// MARK: - DetailDisplayLogic

extension DetailViewController: DetailDisplayLogic {
    func displayInitForm(_ viewModel: DetailModel.InitializationForm.ViewModel) {
        titleLabel.text = viewModel.text
        setupUI()
    }

    func displayTitleChanged(_ viewModel: DetailModel.DescriptionLabelChanged.ViewModel) {
        titleLabel.text = viewModel.formattedText
    }

    func displayToApp(_ viewModel: DetailModel.ToApp.ViewModel) {
        router.routeToApp()
    }
}
