//
//  UserModel.swift
//  iChat
//
//  Created by Никита on 9/3/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

struct MUser: Hashable, Decodable {
    var userName: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
}
