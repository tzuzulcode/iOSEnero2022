//
//  EjemploStackView.swift
//  Ejemplo
//
//  Created by Tzuzul Rosas on 25/01/22.
//

import SwiftUI

struct EjemploStackView: View {
    
    @EnvironmentObject var demoDataEnvironment:DemoData
    
    let carStack:some View = HStack{
        Text("Car image")
        Image(systemName: "car.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    var body: some View {
        let myString = "Welcome to SwiftUI"
        return HStack{
            VStack{
                Text("Text")
                    .font(.largeTitle)
                Text("Text")
                    .font(.headline)
                    .foregroundColor(Color.purple)
                carStack
            }
            VStack{
                Text("Text")
                    .font(.custom("JetBrains Mono Normal", size: 70))
                
                Text("Text")
                    .modifier(StandarTitle())
                    
                Text(myString)
                    .modifier(StandarTitle())
            }.font(.largeTitle)
        }
    }
}

struct StandarTitle: ViewModifier{
    func body(content:Content)-> some View{
        content
            .padding()
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray,width: 0.2)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

struct EjemploStackView_Previews: PreviewProvider {
    static var previews: some View {
        EjemploStackView()
    }
}
