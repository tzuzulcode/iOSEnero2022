//
//  ContentView.swift
//  Chat
//
//  Created by Tzuzul Rosas on 04/04/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        NavigationView{
            AuthView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
