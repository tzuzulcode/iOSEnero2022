//
//  GesturesView.swift
//  Animations
//
//  Created by Tzuzul Rosas on 01/04/22.
//

import SwiftUI

struct GesturesView: View {
    
    @State private var active = false
    
    @State private var magnification: CGFloat = 1.0
    
    
    
    var body: some View {
        
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged{ value in
                print(value)
                magnification = value
                print("Magnifying")
            }
            .onEnded{ _ in
                print("Gesture ended")
            }
        
        let doubleTap = TapGesture(count: 2)
            .onEnded{ _ in
                withAnimation(.easeIn(duration: 1)){
                    active = true
                }
                
            }
        let tap = TapGesture()
            .onEnded{ _ in
                withAnimation(.easeIn(duration: 1)){
                    active.toggle()
                }
            }
        
        return VStack{
            
            Image("photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .gesture(doubleTap)
            Image(systemName: active ? "heart.fill" : "heart")
                .renderingMode(.original)
                .font(.system(size: 60))
                .transition(.slide)
            if active{
                Image(systemName: "heart.fill")
                    .renderingMode(.original)
                    .font(.system(size: 60))
                    .transition(.opacity)
            }else{
                Image(systemName: "heart")
                    .renderingMode(.original)
                    .font(.system(size: 60))
                    .transition(.opacity)
            }
            
            
            Image(systemName: "hand.point.right")
                .font(.largeTitle)
                .gesture(TapGesture(count: 2)
                    .onEnded{ _ in
                        active = true
                        print("Tapped")
                    })
            Image(systemName: "hand.tap")
                .font(.largeTitle)
                .gesture(LongPressGesture(minimumDuration: 2, maximumDistance: 25)
                    .onEnded{ _ in
                        active = false
                        print("Long press")
                    })
            
            Image(systemName: "hand.tap")
                .font(.system(size: 100))
                .scaleEffect(magnification)
                .gesture(magnificationGesture)
            
            Image(systemName: active ? "heart.fill" : "heart")
                .renderingMode(.original)
                .font(.system(size: 60))
                .gesture(tap)
        }
    }
    

}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
