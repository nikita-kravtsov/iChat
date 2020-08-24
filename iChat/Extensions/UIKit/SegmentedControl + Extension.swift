//
//  SegmentedControl + Extension.swift
//  iChat
//
//  Created by Никита on 8/25/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

extension UISegmentedControl {
    convenience init(first: String, second: String) {
        self.init()
        
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.selectedSegmentIndex = 0
    }
}
