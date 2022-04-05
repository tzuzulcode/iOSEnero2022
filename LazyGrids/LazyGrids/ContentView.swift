//
//  ContentView.swift
//  LazyGrids
//
//  Created by Tzuzul Rosas on 24/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 2
    
    var body: some View {
        TabView(selection:$selection){
            LazyGridView()
                .tabItem{
                    Image(systemName: "1.circle")
                    Text("Screen 1")
                }
                .tag(1)
            LazyHGridView()
                .tabItem{
                    Image(systemName: "2.circle")
                    Text("Screen 2")
                }.tag(2)
            ContextMenuView()
                .tabItem{
                    Image(systemName: "3.circle")
                    Text("Screen 3")
                }.tag(3)
            GraphicsView()
                .tabItem{
                    Image(systemName: "4.circle")
                    Text("Screen 4")
                }.tag(4)
        }.font(.largeTitle)
            //.tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
