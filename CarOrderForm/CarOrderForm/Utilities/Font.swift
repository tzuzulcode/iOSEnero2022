//
//  Font.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 28/02/22.
//

import Foundation
import SwiftUI


//Scaled font

struct ScaledFont: ViewModifier{
    var name:String
    var size:CGFloat
    
    func body(content: Content) -> some View {
        /*let scaledFont = Scnt(for: UIFont(name:name,size: size)!)
        
        if let cgFont = CGFont(scaledFont.fontName as CFString){
            
        }*/
        
        return content.font(.custom(name, size: size))
        
    }
}

extension View {
    
    func customAvenir(font:CustomFont,size:CGFloat)->some View{
        return self.modifier(ScaledFont(name: font.rawValue, size: size))
    }
}


enum CustomFont:String{
    case bold = "AvenirNextCondensed-Bold"
    case medium = "AvenirNextCondensed-Medium"
    case ultraLight = "AvenirNextCondensed-UltraLight"
}
