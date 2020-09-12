//
//  ChatModel.swift
//  iChat
//
//  Created by Никита on 9/3/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
import FirebaseFirestore

struct MChat: Hashable, Decodable {
    var friendUserName: String
    var friendImageString: String
    var friendLastMessage: String
    var friendId: String
    
    init(friendUserName: String, friendImageString: String, friendLastMessage: String, friendId: String) {
        self.friendUserName = friendUserName
        self.friendImageString = friendImageString
        self.friendLastMessage = friendLastMessage
        self.friendId = friendId   
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        
        guard let friendUserName = data["friendUserName"] as? String,
        let friendImageString = data["friendImageString"] as? String,
        let friendLastMessage = data["friendLastMessage"] as? String,
        let friendId = data["friendId"] as? String else { return nil }
        
        self.friendUserName = friendUserName
        self.friendImageString = friendImageString
        self.friendLastMessage = friendLastMessage
        self.friendId = friendId
    }
    
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
