//
//  CarElementView.swift
//  OutlineDisclosureGroups
//
//  Created by Tzuzul Rosas on 21/02/22.
//

import SwiftUI

struct CarElementView: View {
    
    var element:CarElement
    
    var body: some View {
        HStack{
            Image(systemName: element.image)
                .foregroundColor(.green)
            Text(element.name)
            
        }
    }
}

struct CarElementView_Previews: PreviewProvider {
    static var previews: some View {
        CarElementView(element: CarElement(name: "Model S", image: "car"))
            .previewLayout(.fixed(width: 100, height: 20))
    }
}
