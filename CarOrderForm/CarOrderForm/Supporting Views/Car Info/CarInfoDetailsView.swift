//
//  CarInfoDetailsView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct CarInfoDetailsView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Transmission")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text("Automatic")
                    .fontWeight(.medium)
                    .font(.system(size: 22))
            }
            Spacer()
            VStack(alignment: .leading){
                Text("Class")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text("Luxury")
                    .fontWeight(.medium)
                    .font(.system(size: 22))
            }
            Spacer()
            VStack(alignment: .leading){
                Text("Year")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text("2020")
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
