//
//  ColorExtension.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 24/02/22.
//

import Foundation
import SwiftUI


extension Color{
    static let baseGray = Color("isabelline")
}

extension UIColor{
    static let baseGray = Color(named:"isabelline")
    
    private static func Color(named key:String) -> UIColor {
        if let color = UIColor(named: key, in: .main, compatibleWith: nil){
            return color
        }
        
        return .black
    }
}
