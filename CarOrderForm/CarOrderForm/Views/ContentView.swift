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
            VStack{
                NavigationLink(destination: OrderDetailsView()){
                    Text("Ir a detalles")
                }
            }
        }.onAppear(){
            print("Appeared")
            cars.getCars()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CarsViewModel())
    }
}
