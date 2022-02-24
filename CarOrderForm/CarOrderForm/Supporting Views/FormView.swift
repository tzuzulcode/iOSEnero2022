//
//  FormView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 24/02/22.
//

import SwiftUI

struct FormView: View {
    
    @State private var option = 0
    var options = [0,1,2,3,4,5]
    
    var body: some View {
        Form{
            rentalPeriod
        }
    }
    
    var rentalPeriod: some View{
        
        Section{
            Picker(selection: $option, label: Text("Rental period")){
                ForEach(0..<options.count){
                    Text("\(options[$0]) hours")
                }
            }
        }
    }
}



struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
