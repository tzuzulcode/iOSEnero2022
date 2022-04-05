//
//  CloseButtonView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 22/03/22.
//

import SwiftUI

struct CloseButtonView: View {
    var body: some View {
        HStack{
            NavigationLink(destination: ContentView()){
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 25, height: 25)
            }
            Spacer()
        }
    }
}

struct CloseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CloseButtonView()
    }
}
