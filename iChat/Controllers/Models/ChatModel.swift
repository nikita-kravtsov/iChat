//
//  ChatModel.swift
//  iChat
//
//  Created by Никита on 9/3/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

struct MChat: Hashable, Decodable {
    var friendUserName: String
    var friendImageString: String
    var friendLastMessage: String
    var friendId: String
    
    var representation: [String: Any] {
        var rep = ["friendUserName": friendUserName]
        rep["friendImageString"] = friendImageString
        rep["friendLastMessage"] = friendLastMessage
        rep["friendId"] = friendId
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}
