//
//  MMessage.swift
//  iChat
//
//  Created by Никита on 9/11/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
import FirebaseFirestore
import MessageKit

struct MMessage: Hashable, MessageType {
  
    let content: String
    var sender: SenderType
    var sentDate: Date
    let id: String?
    var messageId: String {
        return id ?? UUID().uuidString
    }
    var kind: MessageKind {
        return .text(content)
    }
    
    init(user: MUser, content: String) {
        self.content = content
//        senderUserName = user.userName
//        senderId = user.id
        sender = Sender(senderId: user.id, displayName: user.userName)
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
//        self.senderId = senderId
//        self.senderUserName = senderUserName
        sender = Sender(senderId: senderId, displayName: senderUserName)
        self.id = document.documentID
    }
    
    var representation: [String: Any] {
        let rep: [String: Any] = [
            "content": content,
            "senderUserName": sender.displayName,
            "senderID": sender.senderId,
            "created": sentDate
        ]
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }
    
    static func == (lhs: MMessage, rhs: MMessage) -> Bool {
        return lhs.messageId == rhs.messageId
      }
}
