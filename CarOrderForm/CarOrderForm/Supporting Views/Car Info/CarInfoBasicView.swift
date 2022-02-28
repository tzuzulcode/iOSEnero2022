//
//  CarInfoBasicView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct CarInfoBasicView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
            HStack{
                Text("TESLA MODEL S")
                    .customAvenir(font: .bold, size: 28)
                Spacer()
                Image(systemName: "info.circle")
                    .font(.system(size: 28))
            }
            VStack (alignment: .leading,spacing: 4){
                Text("$80/hr")
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                HStack{
                    ForEach(0..<5){ _ in
                        Image(systemName: "star.fill")
                    }
                }
            }
        }
    }
}

struct CarInfoBasicView_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoBasicView()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
