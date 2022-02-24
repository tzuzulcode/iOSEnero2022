//
//  CarInfoPhotosView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct CarInfoPhotosView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Car Interior")
                .fontWeight(.medium)
                .font(.system(size: 22))
                .foregroundColor(.gray)
            HStack{
                Image("pic1")
                    .frame(width: 180, height: 100)
                    .cornerRadius(10)
                Image("pic2")
                    .frame(width: 180, height: 100)
                    .cornerRadius(10)
            }
        }
    }
}

struct CarInfoPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoPhotosView()
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
