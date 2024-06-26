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
        
        label.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
        }

        buttom.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.height.equalTo(60)
            
        }
        
        self.snp.makeConstraints { $0.bottom.equalTo(buttom.snp.bottom) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
