//
//  CarsListView.swift
//  OutlineDisclosureGroups
//
//  Created by Tzuzul Rosas on 21/02/22.
//

import SwiftUI

struct CarsListView: View {
    @State var active = true
    
    var body: some View {
        VStack{
            List{
                Toggle("Activar",isOn: $active)
                ForEach(carElements){ car in
                    DisclosureGroup(isExpanded: $active){
                        OutlineGroup(car.children ?? [CarElement](),children:\.children){
                            CarElementView(element: $0)
                                .onAppear(perform: {
                                    print("Aparecio")
                                })
                                .onDisappear(perform: {
                                    print("Desaparecio")
                                })
                        }
                        .onTapGesture {
                            print("Tap")
                        }
                    }label: {
                        Label{
                            Text(car.name)
                        } icon: {
                            Image(systemName: "car")
                                .foregroundColor(Color.green)
                        }
                    }.accentColor(Color.green)
                }
                
            }.listStyle(SidebarListStyle())
            
            /*Form{
                DisclosureGroup{
                    Toggle("Notificaciones",isOn: $active)
                    Toggle("Notificaciones",isOn: $active)
                    Toggle("Notificaciones",isOn: $active)
                }label: {
                    Label("Notificaciones y alertas",systemImage: "bell")
                }
            }
             */
        }
    }
}

struct CarsListView_Previews: PreviewProvider {
    static var previews: some View {
        CarsListView()
    }
}
