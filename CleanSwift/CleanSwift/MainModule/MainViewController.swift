// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер главного экрана
final class MainViewController: UIViewController {
    // MARK: - Private Enum

    private enum Constants {
        static let errorString = "init(coder:) has not been implemented"
        static let detailButtonString = "К деталям"
    }

    // MARK: - Private Visual Components

    private let galaxyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var detailScreenButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle(Constants.detailButtonString, for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(onDetailAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    private let interactor: MainBusinessLogic
    private let router: MainRoutingLogic

    // MARK: - Initialization

    init(interactor: MainBusinessLogic, router: MainRoutingLogic) {
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
        setupUI()
        initForm()
    }

    // MARK: - Private methods

    private func initForm() {
        let request = MainModel.InitializationForm.Request()
        interactor.requestInitForm(request)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(galaxyImageView)
        view.addSubview(titleLabel)
        view.addSubview(detailScreenButton)
        createConstraints()
    }

    private func createConstraints() {
        NSLayoutConstraint.activate([
            galaxyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            galaxyImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            galaxyImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            galaxyImageView.heightAnchor.constraint(equalToConstant: 250),

            titleLabel.topAnchor.constraint(equalTo: galaxyImageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),

            detailScreenButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            detailScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailScreenButton.widthAnchor.constraint(equalToConstant: 300),
            detailScreenButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    @objc private func onDetailAction() {
        router.routeToDetail()
    }
}

// MARK: - MainDisplayLogic

extension MainViewController: MainDisplayLogic {
    func displayInitForm(_ viewModel: MainModel.InitializationForm.ViewModel) {
        galaxyImageView.image = UIImage(systemName: viewModel.placeholderImage)
        titleLabel.text = viewModel.placeholderText
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let request = MainModel.ShowInfo.Request()
            self.interactor.requestAstronomyInfo(request)
        }
    }

    func displayInfo(_ viewModel: MainModel.ShowInfo.ViewModel) {
        DispatchQueue.main.async {
            self.galaxyImageView.image = UIImage(data: viewModel.imageData)
            self.titleLabel.text = viewModel.description
            self.detailScreenButton.tintColor = .blue
        }
    }
}
