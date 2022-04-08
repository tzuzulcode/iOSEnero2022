//
//  ChatsView.swift
//  Chat
//
//  Created by Tzuzul Rosas on 05/04/22.
//

import SwiftUI

struct ChatsView: View {
    
    @EnvironmentObject var auth: AuthViewModel
    
    @StateObject var chats = ChatsViewModel()
    
    var body: some View {
        VStack{
            
            ForEach(chats.users){ user in
                HStack{
                    AsyncImage(url: URL(string: user.profilePic)){image in
                        image.resizable()
                    }placeholder: {
                        Circle()
                    }.frame(width: 100, height: 100)
                    Text(user.name)
                    
                }
            }
                        
            Text("My chats")
                .onAppear{
                    chats.initDb(uid: auth.idUser)
                    chats.read()
                }
            Text(auth.name)
            Text(auth.profilePic)
        }
        
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView().environmentObject(AuthViewModel())
    }
}
