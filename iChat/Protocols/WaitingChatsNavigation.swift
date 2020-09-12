//
//  WaitingChatsNavigation.swift
//  iChat
//
//  Created by Никита on 9/12/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation

protocol WaitingChatsNavigation: class {
    func removeWaitingChats(chat: MChat)
    func chatToActive(chat:MChat)
}
