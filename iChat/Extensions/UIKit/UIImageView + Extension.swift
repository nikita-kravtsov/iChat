//
//  UIImageView + Extension.swift
//  iChat
//
//  Created by Никита on 8/22/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
