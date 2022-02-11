//
//  ContentView.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 09/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var toggleStatus = false
    @State private var listData:[TodoItem] = [
        TodoItem(task:"Lavar el auto",imageName: "car.fill"),
        TodoItem(task:"Limpiar la casa",imageName: "house.fill"),
        TodoItem(task:"Ir a cierto lugar a las 3pm",imageName: "building.fill"),
        TodoItem(task:"Comprar algo en internet",imageName: "cart.fill"),
        TodoItem(task:"Traer comida",imageName: "bag.fill")
    ]
    
    var body: some View {
        NavigationView{
            List{
                //Secciones dentro de la misma lista
                Section(header: Text("Configuraciones")){
                    Toggle(isOn: $toggleStatus){
                        Text("Permitir notificaciones")
                    }
                }
                Section(header: Text("Lista de tareas")){
                    HStack{
                        Image(systemName: "car.fill")
                        Text("Lavar el auto")
                    }
                    Text("Limpiar la casa")
                    Text("Ir a cierto lugar a las 3pm")
                    Text("Comprar algo en internet")
                    Text("Preparar comida")
                    
                    //Definiendo contenido dinámico en una lista estática
                }
                ForEach(listData){item in
                    NavigationLink(destination: Text(item.task)){
                        HStack{
                            Image("album")
                            Text(item.task)
                        }
                    }
                    
                }.onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
            }
            .navigationTitle(Text("Lista de cosas"))
            .toolbar{
                /*ToolbarItemGroup{
                    Button(action:{}){
                        Text("Añadir")
                    }
                }*/
                EditButton()
                
            }
            
            
            
            /*
             Estableciendo una lista solo dinámica
             List(listData){item in
                 HStack{
                     Image(systemName: item.imageName)
                     Text(item.task)
                 }
             }
             */
            
        }
    }
    
    func deleteItem(at offsets:IndexSet){
        print(offsets)
        listData.remove(atOffsets: offsets)
    }
    func moveItem(from source:IndexSet,to destination:Int){
        listData.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct TodoItem:Identifiable{
    var id = UUID()
    var task:String
    var imageName:String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
