//
//  AuthView.swift
//  Chat
//
//  Created by Tzuzul Rosas on 05/04/22.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var auth:AuthViewModel
    var body: some View {
        VStack{
            
            NavigationLink(destination: ChatsView().navigationBarHidden(true),isActive: $auth.isLoggedIn){
                EmptyView()
            }
            
            Button(action:{
                auth.isLogIn.toggle()
            }){
                Text(auth.isLogIn ? "Register" : "Login")
            }
            
            if !auth.isLogIn{
                TextField("Name...",text: $auth.name)
                TextField("Profile pic...",text: $auth.profilePic)
            }
            
            TextField("Email...",text: $auth.emailField)
            SecureField("Password",text: $auth.passwordField)
            Button(action:{
                auth.auth()
            }){
                Text("Sign in")
            }
            if auth.isLoggedIn{
                Text("Success!!")
                Text(auth.idUser)
                Text(auth.name)
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .environmentObject(AuthViewModel())
    }
}
