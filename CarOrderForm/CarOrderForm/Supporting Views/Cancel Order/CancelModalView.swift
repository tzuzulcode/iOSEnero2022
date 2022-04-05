//
//  CancelModalView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 07/03/22.
//

import SwiftUI

struct CancelModalView: View {
    @EnvironmentObject var order:OrderViewModel
    @State var active = false
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height:190)
                    //.shadow(color: .black, radius: 2, x: 0, y: 0)
                VStack{
                    header
                    buttons
                }
            }
        }
    }
    
    var header: some View{
        HStack{
            VStack(alignment: .leading){
                Text("CANCEL ORDER?")
                    .customAvenir(font: .bold, size: 28)
                Text("You'll return to the car details")
                    .customAvenir(font: .ultraLight, size: 22)
            }.padding()
            Spacer()
        }
    }
    var buttons:some View{
        HStack{
            Button(action:{
                order.isModalVisible = false
            }){
                Text("NO, KEEP IT")
            }.background(Color.baseGray)
                .foregroundColor(.black)
                .buttonStyle(CustomButtonStyle())
                .cornerRadius(10)
                .padding(.leading,10)
            
            
            NavigationLink(destination: ContentView().navigationBarHidden(true),isActive: $active){
                Button(action:{
                    order.isModalVisible=false
                    active=true
                    order.cancelOrder()
                }){
                    Text("YES, CANCEL")
                }.buttonStyle(CustomButtonStyle())
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.trailing,10)
            }
                
        }
    }
}

struct CancelModalView_Previews: PreviewProvider {
    static var previews: some View {
        CancelModalView().environmentObject(OrderViewModel())
    }
}
