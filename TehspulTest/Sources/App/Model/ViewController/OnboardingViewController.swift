//
//  ViewController.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 1.01.24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: Properties
    
    let onboardingView = OnboardingView()
    
    //MARK: Lifecycle
    
    override func loadView() {
        super.loadView()
        view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.isHidden = true
        onboardingView.iniziaButton.addTarget(self, action: #selector(iniziaButtonTapped), for: .touchUpInside)
        onboardingView.onLastCard = {
            self.navigationController?.popViewController(animated: true)
        }
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onboardingView.buttonsView.gradientOfView(withColours: [UIColor(red: 0.995, green: 0.477, blue: 0, alpha: 1), UIColor(red: 1, green: 0.652, blue: 0.131, alpha: 0.6)])
    }
    
    //MARK: Button action

    @objc func iniziaButtonTapped() {
        if onboardingView.stack.storage.count == 1 {
            navigationController?.popViewController(animated: true)
        }
    }

}

