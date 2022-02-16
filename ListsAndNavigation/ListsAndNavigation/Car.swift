//
//  Car.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 15/02/22.
//

import Foundation
import SwiftUI

struct Car : Codable,Identifiable{
    var id: String
    var name: String
    var description: String
    var img: String
    
    
    var image:Image{
        Image(img)
    }
    
}
