//
//  SignUpView.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import SwiftUI

struct SignUpView: View {
    // Importation VM
    @EnvironmentObject var userVM: UserViewModel
    
    // Variable Textfields
    @State var username: String = ""
    @State var email: String = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            List {
                TextField("Username", text: $username)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    
                TextField("Email", text: $email)
                    .autocorrectionDisabled(true)
                    .textCase(.lowercase)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .autocorrectionDisabled(true)
            }.listStyle(.sidebar)
            Button {
                // TODO: ACTION INSCRIPTION
                Task {
                    try await userVM.signUp(username: username.trimmingCharacters(in: .whitespaces), email: email.trimmingCharacters(in: .whitespaces), password: password.trimmingCharacters(in: .whitespaces))
                }
            } label: {
                Text("insciption")
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(UserViewModel())
    }
}
