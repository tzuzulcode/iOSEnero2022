//
//  OrderViewModel.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 03/03/22.
//

import Foundation
import Combine

class SendData:Encodable{
    let rentalPeriod:Int
    let numberOfCars:Int
    let pickUpLocation:Int
    let returnLocation:Int
    let specialDriver:Bool
    let username:String
    
    init(_ rentalPeriod:Int,_ numberOfCars:Int,_ pickUpLocation:Int,_ returnLocation:Int,_ specialDriver:Bool,_ username:String){
        self.rentalPeriod = rentalPeriod
        self.numberOfCars = numberOfCars
        self.pickUpLocation = pickUpLocation
        self.returnLocation = returnLocation
        self.specialDriver = specialDriver
        self.username = username
    }
}

class OrderViewModel: ObservableObject,Codable{
    @Published var rentalPeriod = 0
    @Published var numberOfCars = 0
    @Published var pickUpTime = 0
    @Published var pickUpLocation = 0
    @Published var returnLocation = 0
    @Published var specialDriver = false
    
    @Published var isModalVisible = false
    @Published var isOrderCompleted = false
    @Published var username = "tzuzul"
    
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
        let attributesContainer = try dataContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .attributes)
        
        rentalPeriod = try attributesContainer.decode(Int.self, forKey: .rentalPeriod)
        numberOfCars = try attributesContainer.decode(Int.self, forKey: .numberOfCars)
        pickUpLocation = try attributesContainer.decode(Int.self, forKey: .pickUpLocation)
        returnLocation = try attributesContainer.decode(Int.self, forKey: .returnLocation)
        specialDriver = try attributesContainer.decode(Bool.self, forKey: .specialDriver)
        username = try attributesContainer.decode(String.self, forKey: .username)
        isOrderCompleted = try attributesContainer.decode(Bool.self, forKey: .completed)
        
        print("Order completed")
        print(isOrderCompleted)
        
    }
    
    
    enum CodingKeys:String,CodingKey{
        case data
    }
    
    enum DataKeys:String,CodingKey{
        case rentalPeriod,numberOfCars,pickUpLocation,returnLocation,specialDriver,username,completed
    }
    
    enum AttributesKeys:String,CodingKey{
        case attributes
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
                print(value)
            })
            .store(in: &subscriptions)
        
        print(subscriptions)
    }
}
