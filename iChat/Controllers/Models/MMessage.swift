//
//  MMessage.swift
//  iChat
//
//  Created by Никита on 9/11/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
import FirebaseFirestore

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
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let content = data["content"] as? String else { return nil }
        guard let sentDate = data["created"] as? Timestamp else { return nil }
        guard let senderId = data["senderID"] as? String else { return nil }
        guard let senderUserName = data["senderUserName"] as? String else { return nil }
        
        self.content = content
        self.sentDate = sentDate.dateValue()
        self.senderId = senderId
        self.senderUserName = senderUserName
        self.id = document.documentID
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
