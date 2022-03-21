//
//  CarInfoPhotosView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct CarInfoPhotosView: View {
    @EnvironmentObject var car:Car
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Car Interior")
                .fontWeight(.medium)
                .font(.system(size: 22))
                .foregroundColor(.gray)
            HStack{
                
                ForEach(car.gallery,id: \.self){image in
                    AsyncImage(url: URL(string: "http://localhost:1337"+image))
                        .frame(width: 180, height: 100)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct CarInfoPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoPhotosView()
            .environmentObject(Car())
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
