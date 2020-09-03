//
//  SectionHeader.swift
//  iChat
//
//  Created by Никита on 9/2/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    static let reuseId = "SectionHeader"
    
    let title =  UILabel()
    
    func configure(text: String, font: UIFont?, textColor: UIColor) {
        title.text = text
        title.font = font
        title.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
