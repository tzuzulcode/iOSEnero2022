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
            closeButton
            carInfo
        }
    }
    
    var closeButton: some View{
        HStack{
            Button(action:{}){
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            Spacer()
        }
    }
    
    
    var carInfo:some View{
        VStack{
            Text("ORDER COMPLETED")
                .customAvenir(font: .bold, size: 40)
            HStack{
                Spacer()
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
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
