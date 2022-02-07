//
//  CrossStackAlignmentView.swift
//  StackAlignment
//
//  Created by Tzuzul Rosas on 07/02/22.
//

import SwiftUI

struct CrossStackAlignmentView: View {
    var body: some View {
        HStack(alignment: .crossAlignment){
            Circle()
                .foregroundColor(.purple)
                .alignmentGuide(.crossAlignment, computeValue: {d in d[VerticalAlignment.center]})
                .frame(width: 100, height: 100)
                
            VStack{
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.blue)
                    .alignmentGuide(.crossAlignment, computeValue: {d in d[VerticalAlignment.center]})
                    .frame(width: 100, height: 100)
                    
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 100)
            }
            
        }
    }
}

extension VerticalAlignment{
    private enum CrossAlignment:AlignmentID{
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

struct CrossStackAlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        CrossStackAlignmentView()
    }
}
