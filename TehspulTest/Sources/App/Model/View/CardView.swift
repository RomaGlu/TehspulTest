//
//  CardView.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 3.01.24.
//

import UIKit
import SnapKit

class CardView: UIView {
    
    var cardData: OnboardingModel? {
        didSet {
            if let cardData = cardData {
                cardImageView.image = UIImage(named: cardData.image ?? "")
                cardLongLabel.text = cardData.description
                cardShortLabel.text = cardData.actionLabel
            }
        }
    }
    
    lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var cardLongLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "JosefinSans-Medium", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cardShortLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        label.font = UIFont(name: "JosefinSans-Medium", size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    init(cardData: OnboardingModel) {
        super.init(frame: .zero)
        self.cardData = cardData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowColor = UIColor(red: 0.652, green: 0.652, blue: 0.652, alpha: 0.25).cgColor
    }
    
    private func setupHierarchy() {
        addSubviews(view: [cardImageView, cardLongLabel, cardShortLabel])
    }
    
    private func setupLayout() {
        cardImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(64)
            make.left.equalTo(self.snp.left).offset(58)
            make.right.equalTo(self.snp.right).offset(-58)
            make.bottom.equalTo(self.snp.bottom).offset(-176)
        }
        
        cardLongLabel.snp.makeConstraints { make in
            make.top.equalTo(cardImageView.snp.bottom).offset(16)
            make.left.equalTo(self.snp.left).offset(80)
            make.width.equalTo(185)
            make.height.equalTo(66)
        }
        
        cardShortLabel.snp.makeConstraints { make in
            make.top.equalTo(cardLongLabel.snp.bottom).offset(60)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(16)
        }
    }
}
