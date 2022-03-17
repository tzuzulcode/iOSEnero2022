//
//  CarOrderFormApp.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 23/02/22.
//

import SwiftUI

@main
struct CarOrderFormApp: App {
    @StateObject private var order = OrderViewModel()
    @StateObject private var cars = CarsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
                .environmentObject(cars)
        }
    }
}
