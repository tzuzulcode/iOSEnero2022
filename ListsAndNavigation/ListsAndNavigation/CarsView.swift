//
//  CarsView.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 15/02/22.
//

import SwiftUI

struct CarsView: View {
    @StateObject var carStore : CarStore = CarStore(cars: [
    Car(id: "a1", name: "Tesla", description: "Descripción del auto", image: "tesla1"),
    Car(id: "a2", name: "Tesla 2", description: "Descripción del auto", image: "tesla2")
    ])
    var body: some View {
        NavigationView{
            List {

                ForEach (carStore.cars) { car in
                    ListCell(car: car)
                }
                //Agregar el onDelete y onMove
            }.navigationBarTitle(Text("Tesla cars"))
                .navigationBarItems(leading: NavigationLink(destination: AddNewCarView(carStore: carStore)){
                    Text("Add")
                },trailing: EditButton())
        }
            
        
    }
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}

struct ListCell: View {
    
    var car: Car
    
    var body: some View {
        NavigationLink(destination: CarDetailsView(selectedCar: car)){
            HStack {
                
                Image(car.image)
                
                    .resizable()
                
                    .aspectRatio(contentMode: .fit)
                
                    .frame(width: 100, height: 60)
                
                Text(car.name)
                
            }
        }
        
    }
}
