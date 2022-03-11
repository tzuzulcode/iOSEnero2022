//
//  CustomButtonStyle.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 07/03/22.
//

import Foundation
import SwiftUI

struct CustomButtonStyle:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height:60)
            .frame(minWidth:0,maxWidth:.infinity)
            .customAvenir(font: .bold, size: 24)
            .buttonStyle(PlainButtonStyle())
    }
}
