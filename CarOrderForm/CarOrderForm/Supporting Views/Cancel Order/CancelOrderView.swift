//
//  CancelOrderView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 07/03/22.
//

import SwiftUI

struct CancelOrderView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.clear)
                .background(BlurBackground())
                .edgesIgnoringSafeArea(.all)
                
            ZStack{
                Rectangle()
                    .fill(.black)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height:200)
                    .opacity(0.2)
                    .blur(radius: 10)
                CancelModalView()
                
            }.padding(.horizontal,10)
        }
    }

}

struct CancelOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CancelOrderView()
    }
}
