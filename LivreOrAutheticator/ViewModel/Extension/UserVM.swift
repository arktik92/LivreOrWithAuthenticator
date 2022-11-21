//
//  UserVM.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import SwiftUI

extension UserViewModel {
    
    // MARK: - SIGNIN
    func signIn(username: String, password: String ) async throws -> (SignInResponse) {
        
        // MARK: - URL DE LA REQUEST
        guard let url = URL(string: "\(endPoint)/api/auth/signin")
        else {
            fatalError("Missing URL")
        }
        
        // MARK: - CREATION DES PARAMETRES DE LA REQUÊTE
        let body: [String: String] = ["username" : username,
                                      "password" : password]
        
        // MARK: - ENVOI DE LA REQUETE SUR LE SERVER
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
      
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode(SignInResponse.self, from: data)
        
        print("succes: \(response.accessToken)")
        let keychainItem = KeychainItem(service: "com.arktik.LivreOrAutheticator", account: "accessToken")
        try keychainItem.saveItem(response.accessToken)
        return response
        
    }
    
    // MARK: - SIGNUP
    func signUp(username: String, email: String, password: String ) async throws -> (User) {
        
        // MARK: - URL DE LA REQUEST
        guard let url = URL(string: "\(endPoint)/api/auth/signup")
        else {
            fatalError("Missing URL")
        }
        
        // MARK: - CREATION DE L'OBJET USER
        let body: [String: String] = ["username" : username,
                                      "email" : email,
                                      "password" : password]
        
        // MARK: - ENVOI DE LA REQUETE SUR LE SERVER
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let user = try decoder.decode(User.self, from: data)
        
        print("succes: \(user)")
        return user
        
    }
}

