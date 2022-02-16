//
//  CarStore.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 15/02/22.
//

import Foundation

class CarStore : ObservableObject {

    

    @Published var cars: [Car]

    

    init (cars: [Car] = []) {
        self.cars = cars
    }

}
