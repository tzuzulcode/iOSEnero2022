//
//  CarDetailsView.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 15/02/22.
//

import SwiftUI

struct CarDetailsView: View {
    var selectedCar:Car
    var body: some View {
        Form{
            Section(header: Text("Car Details")) {

                Image(selectedCar.img)

                    .resizable()

                    .cornerRadius(12.0)

                    .aspectRatio(contentMode: .fit)

                    

                    Text(selectedCar.name)

                        .font(.headline)

            

                    Text(selectedCar.description)

                        .font(.body)


            }
        }
    }
}

struct CarDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailsView(selectedCar: cars[0])
    }
}
