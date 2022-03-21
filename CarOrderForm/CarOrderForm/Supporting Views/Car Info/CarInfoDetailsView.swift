//
//  CarInfoDetailsView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct CarInfoDetailsView: View {
    
    @EnvironmentObject var car:Car
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Transmission")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text(car.transmission)
                    .fontWeight(.medium)
                    .font(.system(size: 22))
            }
            Spacer()
            VStack(alignment: .leading){
                Text("Class")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text(car.classType)
                    .fontWeight(.medium)
                    .font(.system(size: 22))
            }
            Spacer()
            VStack(alignment: .leading){
                Text("Year")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text("\(car.year)")
                    .fontWeight(.medium)
                    .font(.system(size: 22))
            }
        }
    }
}

struct CarInfoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoDetailsView()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
