//
//  UserError.swift
//  iChat
//
//  Created by Никита on 9/7/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation

enum UsersError {
    case notFilled
    case photoNotExist
}

extension UsersError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        }
    }
}
