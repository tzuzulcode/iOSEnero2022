//
//  BlurBackground.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 07/03/22.
//

import Foundation
import SwiftUI
struct BlurBackground:UIViewRepresentable{
    var style: UIBlurEffect.Style = .light
    
    func makeUIView(context: UIViewRepresentableContext<BlurBackground>) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
