//
//  ContentView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var cars: CarsViewModel
    
    var body: some View {
        NavigationView{
            List(cars.cars){ car in
                CarDetail(car: car)
            }
        }.onAppear(){
            print("Appeared")
            cars.getCars()
        }
    }
}

struct CarDetail: View{
    var car: Car
    
    var body: some View{
        NavigationLink(destination: OrderDetailsView().environmentObject(car)){
            VStack{
                Text(car.model)
                    .customAvenir(font: .bold, size: 28)
                Text("\(car.price)")
                AsyncImage(url: URL(string: "http://localhost:1337"+car.car)){image in
                    image.resizable()
                        .scaledToFit()
                }placeholder: {
                    Rectangle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CarsViewModel())
    }
}
