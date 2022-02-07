//
//  CustomZStackView.swift
//  StackAlignment
//
//  Created by Tzuzul Rosas on 07/02/22.
//

import SwiftUI

struct CustomZStackView: View {
    var body: some View {
        ZStack(alignment: .myAlignment){
            Circle()
                .foregroundColor(.yellow)
                .alignmentGuide(.myHorizontalAlignment, computeValue: {d in d[.trailing]})
                .alignmentGuide(.myVerticalAlignment, computeValue: {d in d[.bottom]})
                .frame(width: 200, height: 200)
            Rectangle()
                .foregroundColor(.green)
                .alignmentGuide(.myHorizontalAlignment, computeValue: {d in d[HorizontalAlignment.center]})
                .alignmentGuide(.myVerticalAlignment, computeValue: {d in d[VerticalAlignment.top]})
                .frame(width: 200, height: 200)
            Rectangle()
                .foregroundColor(.blue)
                .alignmentGuide(.myHorizontalAlignment, computeValue: {d in d[.leading]})
                .alignmentGuide(.myVerticalAlignment, computeValue: {d in d[VerticalAlignment.bottom]})
                .frame(width: 200, height: 200)
                .cornerRadius(80)
        }
    }
}

extension HorizontalAlignment{
    enum myHorizontal: AlignmentID{
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    
    static let myHorizontalAlignment = HorizontalAlignment(myHorizontal.self)
}

extension VerticalAlignment{
    enum MyVertical: AlignmentID{
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    
    static let myVerticalAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment{
    static let myAlignment = Alignment(horizontal: .myHorizontalAlignment, vertical: .myVerticalAlignment)
}

struct CustomZStackView_Previews: PreviewProvider {
    static var previews: some View {
        CustomZStackView()
    }
}
