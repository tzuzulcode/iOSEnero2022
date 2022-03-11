//
//  BottomOrderView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 28/02/22.
//

import SwiftUI

struct BottomOrderView: View {
    
    @EnvironmentObject var order: OrderViewModel
    var body: some View {
        VStack(spacing:20){
            info
            map
            button
        }.padding()
    }
    
    var info: some View{
        HStack{
            HStack{
                Text("\(order.numberOfCarsOptions[order.numberOfCars])")
                    .customAvenir(font: .medium, size: 22)
                Text("cars")
                    .customAvenir(font: .ultraLight, size: 22)
            }
            Spacer()
            HStack{
                Text("\(order.rentalPeriods[order.rentalPeriod])")
                    .customAvenir(font: .medium, size: 22)
                Text("days")
                    .customAvenir(font: .ultraLight, size: 22)
            }
            Spacer()
            HStack{
                Text("$\(order.rentalPeriods[order.rentalPeriod]*40*order.numberOfCarsOptions[order.numberOfCars])")
                    .customAvenir(font: .medium, size: 22)
            }
            
        }.padding(.horizontal,10)
            .frame(height:55)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.baseGray)
            .cornerRadius(10)
    }
    
    var map: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            Image("sample-map")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 0, maxWidth: .infinity)
            HStack{
                Image(systemName: "clock")
                HStack{
                    Text("The car will arrive in")
                        .customAvenir(font: .ultraLight, size: 22)
                    Text("\(order.pickUpTimes[order.pickUpTime]) mins")
                        .customAvenir(font: .medium, size: 22)
                    
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .frame(height:40)
            .padding(.horizontal,10)
            .background(.white)
            .cornerRadius(5)
            .padding(7)
            
        }
    }
    
    var button:some View{
        Button(action: {
            order.isModalVisible = true
        }){
            Text("CANCEL ORDER")
        }.frame(height:55)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.baseGray)
            .buttonStyle(PlainButtonStyle())
            .cornerRadius(10)
            .foregroundColor(.red)
            .customAvenir(font: .bold, size: 28)
        
    }
}

struct BottomOrderView_Previews: PreviewProvider {
    static var previews: some View {
        BottomOrderView().environmentObject(OrderViewModel())
    }
}
