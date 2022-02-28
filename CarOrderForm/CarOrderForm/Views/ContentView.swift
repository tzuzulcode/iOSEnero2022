//
//  ContentView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            CarInfoView()
            FormView()
        }.foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
