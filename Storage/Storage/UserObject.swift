//
//  UserObject.swift
//  Storage
//
//  Created by Tzuzul Rosas on 03/02/22.
//

import Foundation

class UserObject:ObservableObject{
    @Published var user = User(firstName: "Tzuzul", lastName: "Rosas", age: 23)
    
    func encode()->Data{
        let encoder = JSONEncoder()
        var userEncoded:Data = Data()
        
        if let data = try? encoder.encode(user){
            userEncoded = data
        }
        return userEncoded
    }
    
    func decode(data:Data){
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(User.self, from:data ){
            user = data
        }
    }
}
