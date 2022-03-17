//
//  CarsViewModel.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 15/03/22.
//

import Foundation
import Combine

class CarsViewModel:ObservableObject,Decodable{
    
    @Published var cars:[Car] = []
    private var subscriptions = Set<AnyCancellable>()
    
    
    private let api = API()
    func getCars(){
        self.api.get()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                print("RESPONSE:")
                print(response)
            }, receiveValue: { value in
                self.cars = value.cars
            })
            .store(in: &subscriptions)
    }
    
    init(){
        
    }
    
    required init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.cars = try response.decode([Car].self, forKey: .data)
    }
    
    enum CodingKeys:String,CodingKey{
        case data
    }
    enum AttributeKeys:String,CodingKey{
        case attributes
    }
}
