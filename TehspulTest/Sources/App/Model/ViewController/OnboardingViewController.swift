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
    

    override func loadView() {
        super.loadView()
        view = onboardingView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
    }


}

