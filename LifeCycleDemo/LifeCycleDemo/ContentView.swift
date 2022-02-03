//
//  ContentView.swift
//  LifeCycleDemo
//
//  Created by Tzuzul Rosas on 01/02/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timerData : TimerData
    var body: some View {
        NavigationView{
            VStack{
                Text("Timer count = \(timerData.timerCount)")
                
                Button(action: resetCount){
                    Text("Reset Counter")
                }
                NavigationLink(destination: TabsView()){
                    Text("Tabs view")
                }.padding()
            }
        }
    }
    
    func resetCount(){
        timerData.resetCount()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TimerData())
    }
}
