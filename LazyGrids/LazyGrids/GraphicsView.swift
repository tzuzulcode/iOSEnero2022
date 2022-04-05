//
//  GraphicsView.swift
//  LazyGrids
//
//  Created by Tzuzul Rosas on 25/03/22.
//

import SwiftUI

struct GraphicsView: View {
    
    let colors = Gradient(colors: [Color.red,Color.yellow,Color.green,Color.blue,Color.purple])
    
    var body: some View {
        ScrollView{
            VStack{
                Path { path in

                    path.move(to: CGPoint(x: 10, y: 0))

                    path.addLine(to: CGPoint(x: 10, y: 350))

                    path.addLine(to: CGPoint(x: 300, y: 300))

                    path.closeSubpath()

                }.fill(RadialGradient(gradient:colors,center: .center,startRadius: 0,endRadius:300))
                Circle()
                    .fill(AngularGradient(colors: [Color.red,Color.yellow,Color.green,Color.blue,Color.purple], center: .center))
                    .frame(width:200,height:200)
                Rectangle()
                    .fill(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:200,height:200)
                
                Capsule()
                    .stroke(lineWidth: 5)
                    .foregroundColor(.blue)
                    .frame(width: 150, height: 50)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(style: StrokeStyle(lineWidth:8,dash: [10]))
                    .foregroundColor(.blue)
                    .frame(width:200,height:200)
                Ellipse()
                    .stroke(style: StrokeStyle(lineWidth: 10, dash: [10,5,2] ))
                    .frame(width: 250, height: 100)
                    .foregroundColor(.purple)
                Capsule()
                    .fill(.black)
                    .overlay(Capsule().stroke(.purple,lineWidth: 2))
                    .frame(width: 200, height: 50)
                
                    
            }.padding()
        }
    }
}

struct GraphicsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphicsView()
    }
}
