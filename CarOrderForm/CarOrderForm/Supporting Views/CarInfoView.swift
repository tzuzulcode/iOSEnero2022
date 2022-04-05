//
//  CarInfoView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct CarInfoView: View {
    
    @EnvironmentObject var car:Car
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.baseGray)
                .frame(height: 450)
            VStack{
                CloseButtonView()
                    .offset(y:130)
                VStack{
                    AsyncImage(url: URL(string: "http://localhost:1337"+car.logoBack)).offset(y:120)
                    AsyncImage(url: URL(string: "http://localhost:1337"+car.car)){ image in
                        image.resizable()
                    }placeholder: {
                        Rectangle()
                    }
                        .frame(width:400, height:200)
                    AsyncImage(url: URL(string: "http://localhost:1337"+car.logo)).offset(y:-12)
                }
                
                VStack{
                    CarInfoBasicView()
                    CarInfoDetailsView()
                    CarInfoPhotosView()
                }
            }.offset(y:-155)
                .padding(.horizontal,15)
        }.offset(y:90)
            .frame(height:650)
    }
}

struct CarInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoView().environmentObject(Car())
    }
}
