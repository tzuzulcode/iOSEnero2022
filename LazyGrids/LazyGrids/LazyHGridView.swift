//
//  LazyHGridView.swift
//  LazyGrids
//
//  Created by Tzuzul Rosas on 24/03/22.
//

import SwiftUI

struct LazyHGridView: View {
    private var colors:[Color] = [.blue,.yellow,.green]
    
    private var gridItems = [GridItem(.flexible()),GridItem(.adaptive(minimum: 100)),GridItem(.fixed(150))]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows:gridItems){
                ForEach(0...100,id: \.self){index in
                    CellContent(index: index, color: colors.randomElement()!)
                    
                }
            }.padding()
            
        }
    }
    
    
    struct CellContent:View{
        var index:Int
        var color:Color
        
        var body: some View{
            Text("\(index)")
                .frame(minWidth: 75, minHeight: 50,maxHeight: .infinity)
                .background(color)
                .cornerRadius(8)
                .font(.system(.largeTitle))
        }
    }
}

struct LazyHGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView()
    }
}
