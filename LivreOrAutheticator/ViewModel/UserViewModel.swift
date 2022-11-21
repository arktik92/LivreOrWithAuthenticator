//
//  UserViewModel.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import SwiftUI
class UserViewModel: ObservableObject {
    
    @Published var user: User?
    
    // Variable Textfields
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var signUpIsActive: Bool = false
    @Published var isConnected = false
 
    
    let endPoint: String = "http://localhost:8080"
}
