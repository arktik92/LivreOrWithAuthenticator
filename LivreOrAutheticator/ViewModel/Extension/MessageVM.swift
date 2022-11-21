//
//  MessageVM.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import SwiftUI

extension MessageViewModel {
    
    // MARK: - GET MESSAGES FROM API
    func getMessagesFromApi() async throws -> (Messages) {
        guard let url = URL(string: "\(endPoint)/api/messages")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let message = try decoder.decode(Messages.self, from: data)
        
       
     
        
        print("succes: \(message)")
        return message
    }
}
