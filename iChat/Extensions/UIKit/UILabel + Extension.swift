//
//  UILabel + Extension.swift
//  iChat
//
//  Created by Никита on 8/22/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
