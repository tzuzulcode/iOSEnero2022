//
//  OrderViewModel.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 03/03/22.
//

import Foundation
import Combine

class OrderViewModel: ObservableObject,Codable{
    @Published var rentalPeriod = 0
    @Published var numberOfCars = 0
    @Published var pickUpTime = 0
    @Published var pickUpLocation = 0
    @Published var returnLocation = 0
    @Published var specialDriver = false
    
    @Published var isModalVisible = false
    @Published var isOrderCompleted:Bool = false
    @Published var username = "tzuzul"
    
    var idOrder = 0
    
    let rentalPeriods = Array(1..<10)
    let numberOfCarsOptions = Array(1..<4)
    let pickUpTimes = Array(stride(from:30,through:180,by:30))
    let locations = ["Ciudad de México","Puebla","Monterrey","Guadalajara"]
    
    private let api = API()
    private var subscriptions = Set<AnyCancellable>()
    
    init(){
        
    }
    
    required init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try response.nestedContainer(keyedBy: AttributesKeys.self, forKey: .data)
        
        idOrder = try dataContainer.decode(Int.self, forKey: .id)
        
        
        let attributesContainer = try dataContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .attributes)
        
        rentalPeriod = try attributesContainer.decode(Int.self, forKey: .rentalPeriod)
        numberOfCars = try attributesContainer.decode(Int.self, forKey: .numberOfCars)
        pickUpLocation = try attributesContainer.decode(Int.self, forKey: .pickUpLocation)
        returnLocation = try attributesContainer.decode(Int.self, forKey: .returnLocation)
        specialDriver = try attributesContainer.decode(Bool.self, forKey: .specialDriver)
        username = try attributesContainer.decode(String.self, forKey: .username)
        isOrderCompleted = try attributesContainer.decode(Bool.self, forKey: .completed)
       
    }
    
    
    enum CodingKeys:String,CodingKey{
        case data
    }
    
    enum DataKeys:String,CodingKey{
        case rentalPeriod,numberOfCars,pickUpLocation,returnLocation,specialDriver,username,completed,id
    }
    
    enum AttributesKeys:String,CodingKey{
        case attributes,id
    }

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //let sendData = SendData( rentalPeriod,numberOfCars,pickUpLocation,returnLocation,specialDriver,username)
        //try container.encode(sendData, forKey: .data)
        
        var dataContainer = container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        try dataContainer.encode(rentalPeriod, forKey: .rentalPeriod)
        try dataContainer.encode(numberOfCars, forKey: .numberOfCars)
        try dataContainer.encode(pickUpLocation, forKey: .pickUpLocation)
        try dataContainer.encode(returnLocation, forKey: .returnLocation)
        try dataContainer.encode(specialDriver, forKey: .specialDriver)
        try dataContainer.encode(username, forKey: .username)
    }
    
    
    func createOrder(){
        api.post(with: self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                print("RESPONSE:")
                print(response)
            }, receiveValue: { value in
                print("Response from combine publisher:")
                self.isOrderCompleted = value.isOrderCompleted
                self.idOrder = value.idOrder
            })
            .store(in: &subscriptions)
    }
    
    
    func cancelOrder(){
        api.delete(with: self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                print("RESPONSE:")
                print(response)
            }, receiveValue: { value in
                print("Response from combine publisher:")
                self.isOrderCompleted = false
                self.idOrder = 0
            })
            .store(in: &subscriptions)
    }
}
