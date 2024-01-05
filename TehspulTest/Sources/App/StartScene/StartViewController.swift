//
//  StartViewController.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 5.01.24.
//

import UIKit

class StartViewController: UIViewController {
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont(name: "JosefinSans-Medium", size: 20)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupHierarchy() {
        view.addSubview(startButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 44),
            startButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func startButtonTapped() {
        let viewController = OnboardingViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
