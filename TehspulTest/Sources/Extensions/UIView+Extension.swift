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
            $0.isHidden = false
        }
    }
    
    func gradientOfView(withColours: [UIColor]) {

        var cgColours = [CGColor]()

        for colour in withColours {
            cgColours.append(colour.cgColor)
        }
        
        let grad = CAGradientLayer()
        grad.frame = self.bounds
        grad.colors = cgColours
        self.layer.insertSublayer(grad, at: 0)
    }
    
    
}
