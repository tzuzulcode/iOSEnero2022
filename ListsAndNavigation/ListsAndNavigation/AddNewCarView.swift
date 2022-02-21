//
//  AddNewCarView.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 15/02/22.
//

import SwiftUI

struct AddNewCarView: View {
    @StateObject var carStore:CarStore
    @State private var name:String = ""
    @State private var description:String = ""
    
    
    var body: some View {
        Form{
            Section(header: Text("Car details")){
                Image("tesla1")

                    .resizable()

                    .cornerRadius(12.0)

                    .aspectRatio(contentMode: .fit)
                
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
            }
            Button(action: addNewCar){
                Text("Add car")
            }
        }
    }
    func addNewCar(){
        let newCar = Car(id: UUID().uuidString, name: name, description: description, img: "tesla1")
        
        carStore.cars.append(newCar)
        writeJSON(cars: carStore.cars)
    }
}

struct DataInput: View{
    var title:String
    @Binding var userInput:String
    
    var body: some View{
        VStack{
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
    }
}

struct AddNewCarView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCarView(carStore: CarStore(cars: cars))
    }
}
