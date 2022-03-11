//
//  OrderView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 01/03/22.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: OrderViewModel
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    TopOrderView()
                    BottomOrderView()
                }
            }.navigationBarHidden(true)
            CancelOrderView()
                .opacity(order.isModalVisible ? 1 : 0)
                .animation(.default)
        }
        //.edgesIgnoringSafeArea(.all)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(OrderViewModel())
    }
}
