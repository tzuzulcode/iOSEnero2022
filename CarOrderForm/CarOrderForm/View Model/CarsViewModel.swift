//
//  CarsViewModel.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 15/03/22.
//

import Foundation

class CarsViewModel:Codable{
    
    @Published var cars:[Car] = []
    
    
    private let api = API()
    func getCars(){
        self.api.get(with: self)
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

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}
