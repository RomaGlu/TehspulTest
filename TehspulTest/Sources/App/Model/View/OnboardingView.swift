//
//  OnboardingView.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 2.01.24.
//

import UIKit
import SnapKit

class OnboardingView: UIView {
    
    //MARK: Properties
    
    var stack = Stack<CardView>()
    var cardData: [OnboardingModel] = OnboardingModel.onboardingArray
    var cardViews: [CardView]?
    var onLastCard: (() -> Void)?
    
    var originalBigCenterX: NSLayoutConstraint!
    var originalBigCenterY: NSLayoutConstraint!
    var originalMediumCenterX: NSLayoutConstraint!
    var originalMediumCenterY: NSLayoutConstraint!
    var originalSmallCenterX: NSLayoutConstraint!
    var originalSmallCenterY: NSLayoutConstraint!
    
    var bigLeftAnchor: NSLayoutConstraint!
    var bigRightAnchor: NSLayoutConstraint!
    var bigHeightAnchor: NSLayoutConstraint!
    
    
    var mediumLeftAnchor: NSLayoutConstraint!
    var mediumRightAnchor: NSLayoutConstraint!
    var mediumHeightAnchor: NSLayoutConstraint!
    
    var smallLeftAnchor: NSLayoutConstraint!
    var smallRightAnchor: NSLayoutConstraint!
    var smallHeightAnchor: NSLayoutConstraint!
    
    //MARK: Views
    
    var frontView: UIView?
    var subFrontView: UIView?
    var backView: UIView?
    
    //MARK: Outlets
    
    lazy var buttonsView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var iniziaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("INIZIA", for: .normal)
        button.titleLabel?.font = UIFont(name: "JosefinSans-Medium", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(iniziaButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var rifiutaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RIFIUTA", for: .normal)
        button.titleLabel?.font = UIFont(name: "JosefinSans-Medium", size: 16)
        button.setTitleColor(.systemGray6, for: .normal)
        button.isHidden = true
        return button
    }()
    
    //MARK: Initializators
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        configureViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Layout
    
    private func setupView() {
        backgroundColor = .systemGray6
    }
    
    private func setupHierarchy() {
        addSubviews(view: [ buttonsView, iniziaButton, rifiutaButton ])
        stack.storage.forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            buttonsView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonsView.leftAnchor.constraint(equalTo: self.leftAnchor),
            buttonsView.rightAnchor.constraint(equalTo: self.rightAnchor),
            buttonsView.heightAnchor.constraint(equalToConstant: 96),
            
            iniziaButton.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor),
            iniziaButton.widthAnchor.constraint(equalToConstant: 80),
            iniziaButton.rightAnchor.constraint(equalTo: buttonsView.rightAnchor, constant: -24),
            iniziaButton.heightAnchor.constraint(equalToConstant: 16),
            
            rifiutaButton.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor),
            rifiutaButton.widthAnchor.constraint(equalToConstant: 70),
            rifiutaButton.leftAnchor.constraint(equalTo: buttonsView.leftAnchor, constant: 24),
            rifiutaButton.heightAnchor.constraint(equalToConstant: 16),
            
        ])
        
        for innView in stack.storage {
            if innView == stack.storage.last {
                frontView = innView
                guard let frontView else { return }
                let swipe = UIPanGestureRecognizer(target: self, action: #selector(swipeHandle))
                frontView.addGestureRecognizer(swipe)
                
                originalBigCenterX = frontView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
                originalBigCenterY = frontView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                bigLeftAnchor = frontView.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                                constant: 24)
                bigRightAnchor = frontView.leftAnchor.constraint(equalTo: self.rightAnchor,
                                                                 constant: -24)
                bigHeightAnchor = frontView.heightAnchor.constraint(equalToConstant: 480)
                NSLayoutConstraint.activate([
                    originalBigCenterX,
                    originalBigCenterY,
                    bigLeftAnchor,
                    bigRightAnchor,
                    bigHeightAnchor
                ])
            } else if innView == stack.storage[stack.storage.count - 2] {
                subFrontView = innView
                guard let subFrontView else { return }
                originalMediumCenterX = subFrontView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
                originalMediumCenterY = subFrontView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15)
                mediumLeftAnchor = subFrontView.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                                      constant: 32)
                mediumRightAnchor = subFrontView.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                                        constant: -32)
                mediumHeightAnchor = subFrontView.heightAnchor.constraint(equalToConstant: 480)
                NSLayoutConstraint.activate([
                    originalMediumCenterX,
                    originalMediumCenterY,
                    mediumLeftAnchor,
                    mediumRightAnchor,
                    mediumHeightAnchor
                ])
            } else {
                backView = innView
                guard let backView else { return }
                originalSmallCenterX = backView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
                originalSmallCenterY = backView.centerYAnchor.constraint(equalTo: self.centerYAnchor,
                                                                         constant: 25)
                smallLeftAnchor = backView.leftAnchor.constraint(equalTo: self.rightAnchor,
                                                                 constant: 40)
                smallRightAnchor = backView.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                                   constant: -40)
                smallHeightAnchor = backView.heightAnchor.constraint(equalToConstant: 480)
                NSLayoutConstraint.activate([
                    originalSmallCenterX,
                    originalSmallCenterY,
                    smallLeftAnchor,
                    smallRightAnchor,
                    smallHeightAnchor
                ])
            }
        }
    }
    
    //MARK: Button actions
    
    @objc func iniziaButtonTapped() {
        if self.stack.storage.count > 1 {
            UIView.animate(withDuration: 0.1, animations: {
                guard let frontView = self.frontView else { return }
                frontView.center.x = -(frontView.frame.width / 2)
            }) { _ in
                self.frontView?.removeFromSuperview()
                self.stack.pop()
                self.deactivateConstraints()
                self.setupLayout()
                self.iniziaButton.setTitle("ACCETTA", for: .normal)
                self.iniziaButton.setTitleColor(.orange, for: .normal)
                self.rifiutaButton.isHidden = false
            }
        }
    }
    
    private func configureViews() {
        cardData.reversed().forEach { data in
            stack.push(createView(with: data))
            if let cardView = cardViews {
                for card in cardView {
                    card.cardData = data
                    card.isHidden = true
                }
            }
        }
    }
    
    private func createView(with data: OnboardingModel) -> CardView {
        let view = CardView()
        view.cardData = data
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }
    
    private func deactivateConstraints() {
        originalBigCenterX.isActive = false
        originalBigCenterY.isActive = false
        originalMediumCenterX.isActive = false
        originalMediumCenterY.isActive = false
        originalSmallCenterX.isActive = false
        originalSmallCenterY.isActive = false
        
        bigLeftAnchor.isActive = false
        bigRightAnchor.isActive = false
        mediumLeftAnchor.isActive = false
        mediumRightAnchor.isActive = false
        smallLeftAnchor.isActive = false
        smallRightAnchor.isActive = false
    }
    
    
    @objc func swipeHandle(_ gesture: UIPanGestureRecognizer) {
        guard let frontView = self.frontView else { return }
        guard let view = gesture.view else { return }
        
        let translation = gesture.translation(in: view)
        
        switch gesture.state {
        case .changed:
            if translation.x < 0 {
                let newX = originalBigCenterX.constant + translation.x
                frontView.center.x = newX
            }
        case .ended:
            UIView.animate(withDuration: 0.1, animations: {
                guard let frontView = self.frontView else { return }
                frontView.center.x = -(frontView.frame.width / 2)
            }) { _ in
                frontView.removeFromSuperview()
                self.stack.pop()
                self.deactivateConstraints()
                self.setupLayout()
                self.iniziaButton.setTitle("ACCETTA", for: .normal)
                self.iniziaButton.setTitleColor(.orange, for: .normal)
                self.rifiutaButton.isHidden = false
                
                if self.stack.storage.count == 0 {
                    if let last = self.onLastCard {
                        last()
                    }
                }
            }
        default:
            break
        }
    }
}
