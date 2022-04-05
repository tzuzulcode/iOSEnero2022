//
//  ContentView.swift
//  Animations
//
//  Created by Tzuzul Rosas on 30/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotation:Double = 0
    @State private var scale:Double = 1
    @State private var visibility = false
    @State private var isSpinning = false

    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: GesturesView()){
                    Text("Gestures")
                }
                VStack{
                    
                        
                    
                    Button(action: {
                        //Explicit animation
                        withAnimation(.spring(response: 1, dampingFraction: 0.3, blendDuration: 0)){
                            rotation = rotation<360 ? rotation+60 : 0
                            scale = scale < 3 ? scale + 0.3 : 1
                        }
                    }){
                        
                        Text("Click to animate")
                            .rotationEffect(.degrees(rotation))
                            .scaleEffect(scale)
                            //.animation(.easeOut(duration: 1)) // Animacion implicita
                    }
                    
                    //Animation en state bindings
                    Toggle(isOn: $visibility.animation(.linear(duration: 1))){
                        Text("Toggle views")
                    }.padding()
                    
                    if visibility{
                        Text("Hello world")
                            .font(.largeTitle)
                            .transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                    }else{
                        Text("Goodbye world")
                            .font(.largeTitle)
                            //.transition(AnyTransition.opacity.combined(with: .move(edge: .top)))
                            .transition(.asymmetric(insertion: .scale, removal: .slide))
                    }
                    
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 360)
                        Image(systemName: "car")
                            .font(.largeTitle)
                            .offset(y:-180)
                            .rotationEffect(.degrees(isSpinning ? 0 : 360))
                
                        Image(systemName: "moon.circle.fill")
                            .renderingMode(.original)
                            .font(.largeTitle)
                            .rotationEffect(.degrees(isSpinning ? 0 : 360))
                            
                            
                    }.onAppear(){
                        withAnimation(.linear(duration: 2).repeatForever(autoreverses:false)){
                            isSpinning.toggle()
                        }
                    }
                    
                
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
