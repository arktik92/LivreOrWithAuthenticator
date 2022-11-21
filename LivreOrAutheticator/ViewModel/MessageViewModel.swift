//
//  MessageViewModel.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import SwiftUI

class MessageViewModel: ObservableObject {
    @Published var message: Message?
    @Published var messages: Messages?
    
    let endPoint: String = "http://localhost:8080"
}
