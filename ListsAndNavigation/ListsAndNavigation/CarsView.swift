//
//  CarsView.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 15/02/22.
//

import SwiftUI

struct CarsView: View {
    @StateObject var carStore : CarStore = CarStore(cars:cars)
    var body: some View {
        NavigationView{
            List {

                ForEach (carStore.cars) { car in
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                //Agregar el onDelete y onMove
            }.navigationBarTitle(Text("Tesla cars"))
                .navigationBarItems(leading: NavigationLink(destination: AddNewCarView(carStore: carStore)){
                    Text("Add")
                },trailing: EditButton())
        }
            
        
    }
    
    func deleteItem(at offsets:IndexSet){
        print(offsets)
        carStore.cars.remove(atOffsets: offsets)
        writeJSON(cars: carStore.cars)
    }
    func moveItem(from source:IndexSet,to destination:Int){
        carStore.cars.move(fromOffsets: source, toOffset: destination)
        writeJSON(cars: carStore.cars)
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
                
                Image(car.img)
                
                    .resizable()
                
                    .aspectRatio(contentMode: .fit)
                
                    .frame(width: 100, height: 60)
                
                Text(car.name)
                
            }
        }
        
    }
}
