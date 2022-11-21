//
//  SignInView.swift
//  LivreOrAutheticator
//
//  Created by Esteban SEMELLIER on 18/11/2022.
//

import SwiftUI

struct SignInView: View {
    // Importation VM
    @EnvironmentObject var userVM: UserViewModel
    
    
    var body: some View {
        VStack {
            List {
                TextField("Username", text: $userVM.username)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $userVM.password)
                    .autocorrectionDisabled(true)
            }
            
            NavigationLink("", destination: MessageListView(), isActive: $userVM.isConnected)
            Button {
                Task {
                    do {
                        let _ = try await userVM.signIn(
                            username: userVM.username.trimmingCharacters(in: .whitespaces),
                            password: userVM.password.trimmingCharacters(in: .whitespaces))
                        
                        userVM.isConnected = true
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Sign In")
            }.padding(.bottom, 5)
            HStack {
                Text("Don't have an account ?")
                Button {
                    userVM.signUpIsActive = true
                } label: {
                    Text("Sign Up")
                }
            }
        }
        .sheet(isPresented: $userVM.signUpIsActive) {
            SignUpView()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(UserViewModel())
        
    }
}
