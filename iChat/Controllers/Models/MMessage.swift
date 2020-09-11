//
//  MMessage.swift
//  iChat
//
//  Created by Никита on 9/11/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

struct MMessage: Hashable {
    
    let content: String
    let senderUserName: String
    let senderId: String
    var sentDate: Date
    let id: String?
    
    init(user: MUser, content: String) {
        self.content = content
        senderUserName = user.userName
        senderId = user.id
        sentDate = Date()
        id = nil
    }
    
    var representation: [String: Any] {
        let rep: [String: Any] = [
            "content": content,
            "senderUserName": senderUserName,
            "senderID": senderId,
            "created": sentDate
        ]
        return rep
    }
}
