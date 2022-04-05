//
//  LazyGridView.swift
//  LazyGrids
//
//  Created by Tzuzul Rosas on 24/03/22.
//

import SwiftUI

struct LazyGridView: View {
    private var colors:[Color] = [.blue,.yellow,.green]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:[GridItem(.fixed(75)),GridItem(.fixed(125)),GridItem(.fixed(175))]){
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
                .frame(minWidth: 50, maxWidth:.infinity, minHeight: 100)
                .background(color)
                .cornerRadius(8)
                .font(.system(.largeTitle))
        }
    }
}

struct LazyGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridView()
    }
}
