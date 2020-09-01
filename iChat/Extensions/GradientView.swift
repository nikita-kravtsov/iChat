//
//  GradientView.swift
//  iChat
//
//  Created by Никита on 9/1/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class GradientView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(from: Point, to: Point, startColor: UIColor?, finishColor: UIColor?) {
        self.init()
        
        setupGradient(from: from, to: to, startColor: startColor, finishColor: finishColor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private let gradientLayer = CAGradientLayer()
    
    enum Point {
        case topLeading
        case leading
        case bottomLeading
        case top
        case center
        case bottom
        case topTrailing
        case trailing
        case bottomTrailing
        
        var point: CGPoint {
            switch self {
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeading:
                return CGPoint(x: 0, y: 1.0)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottom:
                return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing:
                return CGPoint(x: 1.0, y: 0.0)
            case .trailing:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
    private func setupGradient(from: Point, to: Point, startColor: UIColor?, finishColor: UIColor?) {
        self.layer.addSublayer(gradientLayer)
        
        setupGradientColors(startColor: startColor, finishColor: finishColor)
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
    }
    
    private func setupGradientColors(startColor: UIColor?, finishColor: UIColor?) {
        if let startColor = startColor, let finishColor = finishColor {
            gradientLayer.colors = [startColor.cgColor, finishColor.cgColor]
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
