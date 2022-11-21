//
//  LivreOrAutheticatorApp.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import SwiftUI

@main
struct LivreOrAutheticatorApp: App {
    @StateObject var messageViewModel = MessageViewModel()
    @StateObject var userViewModel = UserViewModel()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(messageViewModel)
                .environmentObject(userViewModel)
        }
    }
}
