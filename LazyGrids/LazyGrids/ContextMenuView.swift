//
//  ContextMenuView.swift
//  LazyGrids
//
//  Created by Tzuzul Rosas on 25/03/22.
//

import SwiftUI

struct ContextMenuView: View {
    
    @State private var theme = false
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .font(.largeTitle)
                .foregroundColor(theme ? .white : .black)
                .background(theme ? .black : .white)
                .contextMenu{
                    Button(action: {
                        theme = true
                    }){
                        Image(systemName: "moon.circle")
                            .renderingMode(.template)
                            .foregroundColor(.purple)
                        Text("Dark")
                        
                    }
                    Button(action: {
                        theme = false
                    }){
                        Image(systemName: "sun.max.circle")
                            .foregroundColor(.yellow)
                        Text("Light")
                        
                    }
                }
            Image(systemName: theme ? "moon.circle" : "sun.max.circle")
                .foregroundColor(theme ? .purple : .yellow)
        }
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
    }
}
