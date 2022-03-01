//
//  OrderView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 01/03/22.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        ScrollView{
            VStack{
                TopOrderView()
                BottomOrderView()
            }
        }
        //.edgesIgnoringSafeArea(.all)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
