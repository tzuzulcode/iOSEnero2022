//
//  DemoDataView.swift
//  Ejemplo
//
//  Created by Tzuzul Rosas on 28/01/22.
//

import SwiftUI

struct DemoDataView: View {
    
    //@ObservedObject var demoData = DemoData()
    //@StateObject var demoData = DemoData()
    @EnvironmentObject var demoData:DemoData
    
    var body: some View {
        VStack{
            Text("Usuario actual: \(demoData.currentUser)")
            Button(action: cambiarUsuario){
                if(demoData.userCount==0){
                    Text("Iniciar sesión")
                }else{
                    Text("Cerrar sesión")
                }
            }
            
            //Imaginemos que la navegación ya esta configurada:
            NavigationLink(destination: EjemploStackView()){
                Text("Next screen")
            }
            
        }
    }
    
    func cambiarUsuario(){
        if(demoData.userCount==0){
            demoData.currentUser = "Tzuzul"
            demoData.userCount=1
        }else{
            demoData.currentUser = ""
            demoData.userCount = 0
        }
        
    }
}

struct DemoDataView_Previews: PreviewProvider {
    static var previews: some View {
        DemoDataView()
    }
}
