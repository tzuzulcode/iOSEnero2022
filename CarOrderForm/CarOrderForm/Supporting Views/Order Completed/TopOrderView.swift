//
//  TopOrderView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 28/02/22.
//

import SwiftUI

struct TopOrderView: View {
    var body: some View {
        VStack{
            CloseButtonView()
            carInfo
        }.padding(20)
    }
    
    
    var carInfo:some View{
        VStack{
            Text("ORDER COMPLETED")
                .customAvenir(font: .bold, size: 40)
            HStack{
                Spacer()
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width:230,height: 230)
                    .transformEffect(CGAffineTransform(rotationAngle: -2 * (.pi/180)))
                Image("tesla-s")
            }
            Text("Tesla Model S")
                .customAvenir(font: .bold, size: 20)
        }
    }
}

struct TopOrderView_Previews: PreviewProvider {
    static var previews: some View {
        TopOrderView()
    }
}
