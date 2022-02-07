//
//  ContentView.swift
//  StackAlignment
//
//  Created by Tzuzul Rosas on 04/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
            /*Text("Este es un texto")
            Text("Este es un texto más largo")
            Text("Este es un texto")
            HStack(alignment:.firstTextBaseline,spacing:20){
                Text("Este es un texto")
                    .font(.largeTitle)
                Text("Este es un texto más largo")
                    .font(.body)
                Text("Este es un texto")
                    .font(.headline)
            }.background(.blue)
            
            VStack(alignment:.leading){
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: {d in d[HorizontalAlignment.trailing]+40})
                Rectangle()
                    .foregroundColor(.red)
                    .alignmentGuide(.leading, computeValue: {d in d[HorizontalAlignment.trailing]+40})
                    .frame(width: 200, height: 50)
                Rectangle()
                    .foregroundColor(.blue)
                    .alignmentGuide(.leading, computeValue: {d in d[HorizontalAlignment.center]})
                    .frame(width: 180, height: 50)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 180, height: 50)
                    HStack{
                        Text("Hola")
                    }.background()
                    
                }.alignmentGuide(.leading, computeValue:{ d in d[HorizontalAlignment.trailing]})
             
            }*/
            
            CrossStackAlignmentView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
