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
        case getCars
        case del(id:Int)
        var url:URL{
            switch self{
            case .getCars:
                var urlComponent = URLComponents(string:EndPoint.base.appendingPathComponent("/api/cars").absoluteString)
                
                let populate = URLQueryItem(name: "populate", value: "*")
                urlComponent?.queryItems=[populate]
                
                return urlComponent?.url ?? EndPoint.base.appendingPathComponent("/api/cars")
            case .post:
                return EndPoint.base.appendingPathComponent("/api/orders")
            case .del(let id):
                return EndPoint.base.appendingPathComponent("/api/orders/\(id)")
            
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
        
        static func deleteRequest(with url:URL)->URLRequest{
            var request:URLRequest = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            
            return request
        }
    }
    
    
    private let decoder = JSONDecoder()
    
    
    func get()->AnyPublisher<CarsViewModel,Error>{
        
        let request:URLRequest = URLRequest(url:EndPoint.getCars.url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map{
                return $0.data
            }
            .decode(type: CarsViewModel.self, decoder: decoder)
            .mapError{ error in
                switch error{
                case is URLError:
                    //COmpletar tipo de error
                    print(error)
                    return Error.addressUnreachable(EndPoint.getCars.url)
                default:
                    print(error)
                    return Error.invalidResponse
                }
            }
            .map{
                return $0
            }
            .eraseToAnyPublisher()
    }
    
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
    
    //Metodo put nos permite actualizar data de una API
    func delete(with order:OrderViewModel)->AnyPublisher<OrderViewModel,Error>{
        URLSession.shared.dataTaskPublisher(for: EndPoint.deleteRequest(with: EndPoint.del(id: order.idOrder).url))
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
