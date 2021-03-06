//
//  LifeCycleDemoApp.swift
//  LifeCycleDemo
//
//  Created by Tzuzul Rosas on 01/02/22.
//

import SwiftUI

@main
struct LifeCycleDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var timerData = TimerData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timerData)
        }.onChange(of: scenePhase, perform: {phase in
            switch phase{
            case .active:
                print("active")
            case .inactive:
                print("inactive")
            case .background:
                print("background")
            default:
                print("Fase de escena desconocida")
            }
        })
            
    }
}
