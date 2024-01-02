//
//  OnboardingView.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 2.01.24.
//

import UIKit

class OnboardingView: UIView {
    
    //MARK: Properties
    
    //MARK: Outlets
    
    private lazy var showOnboardingButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var middleView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var frontView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var frontImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var buttonsView: UIView = {
        let view = UIView()
        return view
    }()
    
    // перевод кнопок: inizia = старт, pronto = готов,  rifiuta = мусор? , accetta = принимать
    // promozioni = акции, posizione = позиция? ,
    
    private lazy var furtherButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    
    //MARK: Initializators
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Layout
    
    private func setupView() {
        makeHidden(view: [bottomView, furtherButton])
    }
    
    private func setupHierarchy() {
        addSubviews(view: [showOnboardingButton,
                           bottomView,
                           middleView,
                           frontView,
                           
                           frontImageView,
                           
                           buttonsView,
                           furtherButton,
                           closeButton
                          ])
    }
    
    private func setupLayout() {
        
    }
}
