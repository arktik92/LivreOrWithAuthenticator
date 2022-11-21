//
//  MessageListView.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import SwiftUI

struct MessageListView: View {
    
    @EnvironmentObject var messageVM: MessageViewModel
    
    var body: some View {
        
        VStack {
            Text("UserViewModel")
            ForEach(messageVM.messages?.messages ?? [], id: \.self) { item in
                Text(item.messages.description)
            }
            .onAppear {
                Task {
                    messageVM.messages = try await messageVM.getMessagesFromApi()
                }
            }
        .navigationBarBackButtonHidden()
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
            .environmentObject(MessageViewModel())
    }
}
