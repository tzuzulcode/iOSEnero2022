//
//  AuthViewModel.swift
//  Chat
//
//  Created by Tzuzul Rosas on 05/04/22.
//

import Foundation
import FirebaseFirestore
import Firebase

class AuthViewModel:ObservableObject{
    @Published var isLogIn = true
    @Published var isLoggedIn = false
    @Published var name = ""
    @Published var profilePic = ""
    @Published var idUser = ""
    
    @Published var emailField = ""
    @Published var passwordField = ""
    
    @Published var isError = false
    @Published var errorMessage = ""
    
    let db = Firestore.firestore()
    
    func login(){
        Auth.auth().signIn(withEmail: emailField, password: passwordField){ (result,error) in
            if error != nil{
                print(error?.localizedDescription ?? "Error de auth")
                
                self.isError = true
                self.errorMessage = "Please, review your credentials"
            }else{
                if let id=result?.user.uid {
                    self.idUser = id
                    print(self.idUser)
                }
                if let name=result?.user.displayName {
                    self.name = name
                }
                
                self.db.collection("users").document(self.idUser).getDocument{ (document,error) in
                    if error != nil{
                        print(error!)
                    }
                    
                    if let document = document,document.exists{
                        if let data = document.data(){
                            print(data)
                            self.name = data["name"] as! String
                            self.profilePic = data["profilePic"] as! String
                        }
                    }
                }
                self.isLoggedIn = true
            }
        }
    }
    
    func signup(){
        Auth.auth().createUser(withEmail: emailField, password: passwordField){ (result,error) in
            if error != nil{
                print(error?.localizedDescription ?? "Error de auth")
                
                self.isError = true
                self.errorMessage = "The email is already in use"
            }else{
                if let id=result?.user.uid {
                    self.idUser = id
                    
                }
                if let name=result?.user.displayName {
                    self.name = name
                }
                
                self.db.collection("users").document(self.idUser).setData([
                    "name":self.name,
                    "profilePic":self.profilePic
                ])

                self.isLoggedIn = true
            }
        }
            
        
    }
    
    func auth(){
        if isLogIn {
            login()
        }else{
            signup()
        }
    }
}
