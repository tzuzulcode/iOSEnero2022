//
//  FirstTabView.swift
//  LifeCycleDemo
//
//  Created by Tzuzul Rosas on 01/02/22.
//

import SwiftUI

struct FirstTabView: View {
    @EnvironmentObject var timerData: TimerData
    var body: some View {
        Text("\(timerData.timerCount)")
            .font(.largeTitle)
            .fontWeight(.bold)
            .onAppear(perform: {
                print("onAppear realizado: view1")
            })
            .onDisappear(perform: {
                print("onDisappear realizado: view1")
            })
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView().environmentObject(TimerData())
    }
}
