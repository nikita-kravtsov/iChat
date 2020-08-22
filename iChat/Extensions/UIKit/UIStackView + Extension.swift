//
//  UIStackView + Extension.swift
//  iChat
//
//  Created by Никита on 8/23/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}
