//
//  User.swift
//  Storage
//
//  Created by Tzuzul Rosas on 03/02/22.
//

import Foundation

struct User: Encodable,Decodable{
    var firstName:String
    var lastName:String
    var age:Int
}

//var tzuzul = User(firstName: "Tzuzul", lastName: "Code", age: 23)
