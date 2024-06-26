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
        
        title.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
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
