//
//  DemoData.swift
//  Ejemplo
//
//  Created by Tzuzul Rosas on 28/01/22.
//

import Foundation
import Combine

class DemoData : ObservableObject {
    @Published var userCount = 0
    @Published var currentUser = ""
    
    
    init(){
        //Hacer algo
    }
    
    private func updateData(){
        
    }
    
}
