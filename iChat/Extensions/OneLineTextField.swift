//
//  OneLineTextField.swift
//  iChat
//
//  Created by Никита on 8/23/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class OneLineTextField: UITextField {
    convenience init(font: UIFont? = .avenir20()) {
        self.init()
        
        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var buttomView = UIView()
        buttomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        buttomView.backgroundColor = .textFieldLight()
        buttomView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttomView)

        buttomView.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(1)
        }
    }
}
