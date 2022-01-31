//
//  StatePropertyView.swift
//  Ejemplo
//
//  Created by Tzuzul Rosas on 27/01/22.
//

import SwiftUI

struct StatePropertyView: View {
    @State private var wifiEnabled = false
    @State private var userName = ""
    @State private var isHidden = true
    var body: some View {
        VStack{
            Toggle(isOn: $wifiEnabled){
                Text("Enable Wi-Fi")
            }
            Toggle(isOn: $isHidden){
                Text("Oculto")
            }
            TextField("Enter a username",text: $userName)
            Text(userName)
            WifiImageView(wifiEnabled: $wifiEnabled)
            if !isHidden {
                Text("Hola, mensaje secreto")
            }
            
        }
    }
}

struct StatePropertyView_Previews: PreviewProvider {
    static var previews: some View {
        StatePropertyView()
    }
}

struct WifiImageView:View{
    @Binding var wifiEnabled: Bool
    var body: some View{
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
            .resizable()
            .frame(width: 100, height: 100)
    }
}
