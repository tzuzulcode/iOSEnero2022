//
//  API.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 09/03/22.
//

import Foundation
import Combine


struct API{
    
    enum Error:LocalizedError,Identifiable{
        var id:String{localizedDescription}
        
        case addressUnreachable(URL)
        case invalidResponse
        
        var errorDescription: String?{
            switch self {
            case .addressUnreachable(let url):
                return "The server couldn't respond: \(url)"
            case .invalidResponse:
                return "The server response is incorrect"
            }
        }
    }
    
    enum EndPoint{
        static let base = URL(string: "http://localhost:1337")!
        
        case post
        var url:URL{
            switch self{
            case.post:
                return EndPoint.base.appendingPathComponent("/api/orders")
            }
        }
        static func request(with url:URL, and order:OrderViewModel)->URLRequest{
            guard let encoded = try? JSONEncoder().encode(order)else{
                fatalError("Invalid ViewModel")
            }
            
            var request = URLRequest(url:url)
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = encoded
            
            return request
        }
    }
    private let decoder = JSONDecoder()
    
    func post(with order:OrderViewModel)->AnyPublisher<OrderViewModel,Error>{
        URLSession.shared.dataTaskPublisher(for: EndPoint.request(with: EndPoint.post.url, and: order))
            .map{
                return $0.data
            }
            .decode(type: OrderViewModel.self, decoder: decoder)
            .mapError{ error in
                switch error{
                case is URLError:
                    //COmpletar tipo de error
                    return Error.addressUnreachable(EndPoint.post.url)
                default:
                    return Error.invalidResponse
                }
                
            }
            .map{
                return $0
            }
            .eraseToAnyPublisher()
    }
}
