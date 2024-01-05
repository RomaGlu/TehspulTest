//
//  UIView+Extension.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 2.01.24.
//

import UIKit

extension UIView {
    func addSubviews(view: [UIView]) {
        view.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func makeHidden(view: [UIView]) {
        view.forEach {
            $0.isHidden = true
        }
    }
    
    func gradientOfView(withColours: [UIColor]) {

        var cgColours = [CGColor]()

        for colour in withColours {
            cgColours.append(colour.cgColor)
        }
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = cgColours
        self.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
}
