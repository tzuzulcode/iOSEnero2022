//
//  EventHandlingView.swift
//  Ejemplo
//
//  Created by Tzuzul Rosas on 26/01/22.
//

import SwiftUI

struct EventHandlingView: View {
    var body: some View {
        VStack{
            Button(action: buttonPressed){
                Text("Presionar")
            }
            
            Button(action: {
                print("Boton presionado")
            }){
                Text("Presionar")
            }
            Button(action: {
                print("Boton presionado")
            }){
                Image(systemName: "square.and.arrow.down")
                Text("Presionar")
            }
            Label("Hola mundo",systemImage: "person.circle.fill")
                .font(.largeTitle)
            Button(action: buttonPressed){
                Label("Hola mundo",systemImage: "person.circle.fill")
                    .font(.largeTitle)
            }
            
            VStack(alignment: .center,spacing: 15){
                Text("Financial results")
                    .font(.title)
                    .border(Color.black)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    /*.frame(width: 150, height: 200, alignment: .center)*/
                HStack(alignment:.top,spacing:15){
                    Text("Q1 Sales")
                        .font(.headline)
                    Spacer()
                    VStack(alignment:.leading,spacing: 5){
                        Group{
                            Text("January")
                            Text("February")
                            Text("March")
                            Text("January")
                            Text("February")
                            Text("March")
                            Text("January")
                            Text("February")
                            Text("March")
                            Text("January")
                        }
                        Group{
                            Text("January")
                            Text("February")
                            Text("March")
                            Text("January")
                            Text("February")
                            Text("March")
                            Text("January")
                            Text("February")
                            Text("March")
                            HStack{
                                Image(systemName: "airplane")
                                Text("Flight times:")
                                Text("México")
                                    .layoutPriority(1)
                            }
                                .lineLimit(1)
                                .frame(width: 120 )
                        }
                    }
                    Spacer()
                    VStack(alignment:.trailing,spacing: 5){
                        Text("$1000")
                        Text("$2000")
                        Text("$3000")
                    }
                }.padding()
            }
        }
    }
    
    func buttonPressed(){
        print("Boton presionado")
    }
}

struct EventHandlingView_Previews: PreviewProvider {
    static var previews: some View {
        EventHandlingView()
    }
}
