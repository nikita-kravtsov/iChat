//
//  ButtomView.swift
//  iChat
//
//  Created by Никита on 8/23/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class ButtomView: UIView {
    
    init(label: UILabel, buttom: UIButton) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        buttom.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        self.addSubview(buttom)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttom.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            buttom.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttom.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttom.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        self.bottomAnchor.constraint(equalTo: buttom.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
