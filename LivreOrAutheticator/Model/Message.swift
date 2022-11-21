//
//  Message.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import Foundation

// MARK: - Message
struct Message: Codable {
    var id: Int
    var content: String
    var userID: Int
    var user: User
}

struct Messages: Hashable, Codable {
    var messages: [Messages]
}
