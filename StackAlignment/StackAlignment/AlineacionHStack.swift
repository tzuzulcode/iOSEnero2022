//
//  AlineacionHStack.swift
//  StackAlignment
//
//  Created by Tzuzul Rosas on 04/02/22.
//

import SwiftUI

struct AlineacionHStack: View {
    var body: some View {
        HStack{
            HStack(alignment:.oneThird){
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 50, height: 200)
                    .alignmentGuide(.oneThird, computeValue: {d in d[VerticalAlignment.bottom]})
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 50, height: 200)
                    .alignmentGuide(.oneThird, computeValue: {d in d[VerticalAlignment.top]})
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 50, height: 200)
                    .alignmentGuide(.oneThird, computeValue: {d in d[VerticalAlignment.bottom]})
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .frame(width: 50, height: 200)
                    .alignmentGuide(.oneThird, computeValue: {d in d[VerticalAlignment.top]})
            }
            Rectangle()
        }
        
    }
}

extension VerticalAlignment{
    private enum OneThird:AlignmentID{
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height/3
        }
    }
    
    static let oneThird = VerticalAlignment(OneThird.self)
}

struct AlineacionHStack_Previews: PreviewProvider {
    static var previews: some View {
        AlineacionHStack()
    }
}
