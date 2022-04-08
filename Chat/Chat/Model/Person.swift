//
//  Person.swift
//  Chat
//
//  Created by Tzuzul Rosas on 08/04/22.
//

import Foundation


class Person:Identifiable{
    var name:String
    var profilePic:String
    var id:String
    
    init(name:String,profilePic:String,id:String){
        self.name = name
        self.profilePic = profilePic
        self.id = id
    }
}
