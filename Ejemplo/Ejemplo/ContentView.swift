//
//  ContentView.swift
//  Ejemplo
//
//  Created by Tzuzul Rosas on 24/01/22.
//

import SwiftUI

struct ContentView: View {
    let demoDataEnvironment:DemoData = DemoData()
    var body: some View {
        //ViewGroup
        /*VStack{
            HStack{
                Text("Hola, mundo!!")
                Text("Adios")
            }
            EjemploStackView()
            MyHStack()
            
        }*/
        
        //EventHandlingView()
        DemoDataView()
            .environmentObject(demoDataEnvironment)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            /*
            ContentView()
                .previewDevice("iPhone 11")
                .environment(\.colorScheme, .dark)
            ContentView()
                .previewDevice("iPhone SE (2nd generation)")
             */
            ContentView()
            
        }
        
    }
}

struct MyHStack:View{
    var body: some View{
        HStack{
            Text("Saludos!")
            Text("Saludos!")
        }
    }
}
