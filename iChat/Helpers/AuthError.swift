//
//  AuthError.swift
//  iChat
//
//  Created by Никита on 9/6/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordNotMatched
    case unknownError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Неверный email", comment: "")
        case .passwordNotMatched:
            return NSLocalizedString("Пароли не совпадает", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        }
    }
}
