//
//  ChatApp.swift
//  Chat
//
//  Created by Tzuzul Rosas on 04/04/22.
//

import SwiftUI
import Firebase

@main
struct ChatApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
