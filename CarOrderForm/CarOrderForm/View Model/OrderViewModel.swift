//
//  OrderViewModel.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 03/03/22.
//

import Foundation

class OrderViewModel: ObservableObject{
    @Published var rentalPeriod = 0
    @Published var numberOfCars = 0
    @Published var pickUpTime = 0
    @Published var pickUpLocation = 0
    @Published var returnLocation = 0
    @Published var specialDriver = false
    
    @Published var isModalVisible = false
    @Published var isOrderCompleted = false
    
    let rentalPeriods = Array(1..<10)
    let numberOfCarsOptions = Array(1..<4)
    let pickUpTimes = Array(stride(from:30,through:180,by:30))
    let locations = ["Ciudad de México","Puebla","Monterrey","Guadalajara"]
}
