//
//  CarsListView.swift
//  OutlineDisclosureGroups
//
//  Created by Tzuzul Rosas on 21/02/22.
//

import SwiftUI

struct CarsListView: View {
    var body: some View {
        List(carElements,children:\.children){
            CarElementView(element: $0)
        }.listStyle(SidebarListStyle())
    }
}

struct CarsListView_Previews: PreviewProvider {
    static var previews: some View {
        CarsListView()
    }
}
