//
//  ContentView.swift
//  Storage
//
//  Created by Tzuzul Rosas on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var userObject = UserObject()
    
    @AppStorage("tzuzulCodeStore",
                store:UserDefaults(suiteName: "group.tzuzulcode.userdefaults"))
    var city: String = ""
    
    @AppStorage("tzuzulCodeStore",
                store:UserDefaults(suiteName: "group.tzuzulcode.userdefaults"))
    var user: Data = Data()
    
    
    
    init(){
        user = userObject.encode()
        print(user)
    }
    
    func convertir(){
        print(user)
        userObject.decode(data: user)
        print(userObject.user)
    }

    
    var body: some View {
        VStack{
            TextEditor(text: $city)
                .padding()
            Button(action:{
                convertir()
            }){
                Text("Decodificar")
            }
            Button(action:{
                userObject.user.firstName = "Tzuzul V2"
                user = userObject.encode()
            }){
                Text("Cambiar nombre")
            }
            Text(userObject.user.firstName)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
