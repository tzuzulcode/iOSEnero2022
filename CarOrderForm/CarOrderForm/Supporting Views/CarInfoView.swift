//
//  CarInfoView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct CarInfoView: View {
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.baseGray)
                .frame(height: 450)
            VStack{
                VStack{
                    Image("tesla-logo")
                        .offset(y:120)
                    Image("tesla-s")
                    Image("tesla-text-logo")
                        .offset(y:-12)
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
        CarInfoView()
    }
}
