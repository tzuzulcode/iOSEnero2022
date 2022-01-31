//
//  ContentView.swift
//  SwiftDemo
//
//  Created by Tzuzul Rosas on 31/01/22.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colorNames = ["Black","Red","Green","Blue"]
    @State private var rotation:Double = 0
    @State private var text = "Hola mundo desde Swift"
    @State private var colorIndex = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 1))
                .foregroundColor(colors[colorIndex])
                .padding()
            Spacer()
            Divider()
            Slider(value: $rotation,in: 0 ... 360,step: 0.1)
                .padding()
            
            TextField("Ingresa mensaje de bienvenida...",text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Picker(selection: $colorIndex, label: Text("Color")){
                ForEach(0..<colorNames.count){ color in
                    Text(colorNames[color])
                }
                /*ForEach(0..<colorNames.count){
                    Text(colorNames[$0])
                        .foregroundColor(colors[$0])
                }*/
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
