//
//  SelfConfiguringCell.swift
//  iChat
//
//  Created by Никита on 9/2/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

protocol SelfConfiguringCell {
    
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
