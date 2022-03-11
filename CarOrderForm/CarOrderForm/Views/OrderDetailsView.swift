//
//  OrderDetailsView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 08/03/22.
//

import SwiftUI

struct OrderDetailsView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing:0){
                CarInfoView()
                    .padding(.horizontal,20)
                FormView()
                    .frame(height:500)
            }
        }.navigationBarHidden(true)
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView()
    }
}
