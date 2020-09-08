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
    case cannotGetUserInfo
    case cannotUnwrapToMUser
}

extension UsersError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Ошибка! Невозможно получить информацию о пользователе из Firebase!", comment: "")
        case .cannotUnwrapToMUser:
            return NSLocalizedString("Ошибка! Невозможно конвертировать MUser из User", comment: "")
        }
    }
}
